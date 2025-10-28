import { api } from './api_service.js';

const mainContent = document.getElementById('admin-app-content');
const token = localStorage.getItem('jwt_token');

if (!token) {
    window.location.href = 'index.php#login';
}

async function loadPage(page) {
    try {
        mainContent.innerHTML = '<h1>Loading...</h1>';
        const html = await api.getTemplate(page);
        mainContent.innerHTML = html;

        if (page === 'admin_products') await initAdminProductsPage();
        if (page === 'admin_orders') await initAdminOrdersPage();

    } catch (error) {
        console.error('Error loading admin page:', page, error);
        mainContent.innerHTML = `<h1>Error loading Admin page (${page})</h1><p>${error.message}</p>`;
    } finally {
        window.scrollTo(0, 0);
    }
}

async function initAdminProductsPage() {
    const form = document.getElementById('product-form');
    const tableBody = document.querySelector('#admin-product-list tbody');
    const showAddFormBtn = document.getElementById('btn-show-add-form');
    const cancelEditBtn = document.getElementById('btn-cancel-edit');
    const brandSelect = document.getElementById('product_brand');
    const categorySelect = document.getElementById('product_category');

    if (!form || !tableBody || !showAddFormBtn || !cancelEditBtn || !brandSelect || !categorySelect) {
        console.error("Missing essential elements on admin products page.");
        mainContent.innerHTML = '<h2>Product management page structure error.</h2>';
        return;
    }

    tableBody.innerHTML = '<tr><td colspan="4">Loading data...</td></tr>';

    const [brandsRes, categoriesRes, productsRes] = await Promise.all([
        api.getBrands(),
        api.getCategories(),
        api.getProducts()
    ]);

    brandSelect.innerHTML = '<option value="">-- Select brand --</option>';
    if (brandsRes && brandsRes.success && brandsRes.data) {
        brandsRes.data.forEach(b => brandSelect.innerHTML += `<option value="${b.brand_id}">${b.brand_name}</option>`);
    } else {
        console.warn("Could not load brands:", brandsRes ? brandsRes.message : "API Error");
    }

    categorySelect.innerHTML = '<option value="">-- Select category --</option>';
    if (categoriesRes && categoriesRes.success && categoriesRes.data) {
        categoriesRes.data.forEach(c => categorySelect.innerHTML += `<option value="${c.category_id}">${c.category_name}</option>`);
    } else {
        console.warn("Could not load categories:", categoriesRes ? categoriesRes.message : "API Error");
    }

    function renderTable(products) {
        tableBody.innerHTML = '';
        if (!products || products.length === 0) {
            tableBody.innerHTML = '<tr><td colspan="4">No products found.</td></tr>';
            return;
        }
        products.forEach(p => {
            tableBody.innerHTML += `
                <tr data-id="${p.product_id}">
                    <td>${p.product_id}</td>
                    <td>${p.product_name || 'N/A'}</td>
                    <td>${p.Price ? parseFloat(p.Price).toLocaleString('en-US') : '0'} ₫</td>
                    <td>
                        <button class="btn-edit" data-product-id="${p.product_id}">Edit</button>
                        <button class="btn-delete" data-product-id="${p.product_id}">Delete</button>
                    </td>
                </tr>
            `;
        });
    }

    if (productsRes && productsRes.success && productsRes.data) {
        renderTable(productsRes.data);
    } else {
        tableBody.innerHTML = `<tr><td colspan="4">Error loading product list: ${productsRes ? productsRes.message : 'API Error'}</td></tr>`;
    }

    showAddFormBtn.addEventListener('click', () => {
        form.reset();
        document.getElementById('product_id').value = '';
        form.style.display = 'block';
    });

    cancelEditBtn.addEventListener('click', () => {
        form.style.display = 'none';
        form.reset();
    });

    tableBody.addEventListener('click', async (e) => {
        const target = e.target;
        const productId = target.dataset.productId;

        if (!productId) return;

        if (target.classList.contains('btn-delete')) {
            if (confirm(`Are you sure you want to delete product ID: ${productId}? This action cannot be undone.`)) {
                target.disabled = true;
                target.textContent = 'Deleting...';
                const res = await api.admin_deleteProduct(productId, token);
                if (res.success) {
                    alert('Deleted successfully!');
                    const rowToRemove = tableBody.querySelector(`tr[data-id="${productId}"]`);
                    if (rowToRemove) rowToRemove.remove();
                } else {
                    alert(`Error deleting product: ${res.message || 'Unknown error'}`);
                    target.disabled = false;
                    target.textContent = 'Delete';
                }
            }
        }

        if (target.classList.contains('btn-edit')) {
            const product = productsRes.data.find(p => p.product_id == productId);
            if (product) {
                document.getElementById('product_id').value = product.product_id;
                document.getElementById('product_name').value = product.product_name;
                document.getElementById('product_price').value = product.Price;
                document.getElementById('product_brand').value = product.brand_id;
                document.getElementById('product_category').value = product.category_id;
                document.getElementById('product_description').value = product.product_description;
                document.getElementById('product_quantity').value = product.stock_quantity;
                document.getElementById('product_main_image').value = product.main_image || '';
                form.style.display = 'block';
            } else {
                 alert('Product data not found for editing.');
            }
        }
    });

    form.addEventListener('submit', async (e) => {
        e.preventDefault();
        const submitButton = form.querySelector('button[type="submit"]');

        const productData = {
            product_id: document.getElementById('product_id').value,
            product_name: document.getElementById('product_name').value,
            Price: document.getElementById('product_price').value,
            brand_id: document.getElementById('product_brand').value || null,
            category_id: document.getElementById('product_category').value || null,
            product_description: document.getElementById('product_description').value,
            stock_quantity: document.getElementById('product_quantity').value || 0,
            main_image: document.getElementById('product_main_image').value || null
        };

        if (!productData.product_name || !productData.Price) {
            alert('Please enter Product Name and Price.');
            return;
        }

        submitButton.disabled = true;
        submitButton.textContent = 'Saving...';

        let res;
        if (productData.product_id) {
            res = await api.admin_updateProduct(productData, token);
        } else {
            delete productData.product_id;
            res = await api.admin_createProduct(productData, token);
        }

        if (res.success) {
            alert('Product saved successfully!');
            form.style.display = 'none';
            form.reset();
            loadPage('admin_products');
        } else {
            alert(`Error saving product: ${res.message || 'Unknown error'}`);
            submitButton.disabled = false;
            submitButton.textContent = 'Save Product';
        }
    });
}

async function initAdminOrdersPage() {
    const tableBody = document.querySelector('#admin-order-list tbody');
    if (!tableBody) {
        console.error("Missing table body for admin orders page.");
        mainContent.innerHTML = '<h2>Order management page structure error.</h2>';
        return;
    }

    tableBody.innerHTML = '<tr><td colspan="6">Loading orders...</td></tr>';

    const res = await api.admin_getAllOrders(token);

    if (!res || !res.success || !res.data) {
        tableBody.innerHTML = `<tr><td colspan="6">Error loading orders: ${res ? res.message : 'API Error'}</td></tr>`;
        return;
    }

    tableBody.innerHTML = '';
    if (res.data.length === 0) {
         tableBody.innerHTML = '<tr><td colspan="6">No orders found.</td></tr>';
         return;
    }

    res.data.forEach(order => {
        tableBody.innerHTML += `
            <tr data-order-id="${order.order_id}">
                <td>${order.order_code || 'N/A'}</td>
                <td>${order.customer_name || 'Guest'}</td>
                <td>${order.created_at ? new Date(order.created_at).toLocaleDateString('en-US') : 'N/A'}</td>
                <td>${order.total_amount ? parseFloat(order.total_amount).toLocaleString('en-US') : '0'} ₫</td>
                <td>
                    <select class="status-select" data-order-id="${order.order_id}">
                        <option value="pending" ${order.order_status == 'pending' ? 'selected' : ''}>Pending</option>
                        <option value="processing" ${order.order_status == 'processing' ? 'selected' : ''}>Processing</option>
                        <option value="shipped" ${order.order_status == 'shipped' ? 'selected' : ''}>Shipped</option>
                        <option value="delivered" ${order.order_status == 'delivered' ? 'selected' : ''}>Completed</option>
                        <option value="cancelled" ${order.order_status == 'cancelled' ? 'selected' : ''}>Cancelled</option>
                    </select>
                </td>
                <td><button class="btn-update-status" data-order-id="${order.order_id}">Update</button></td>
            </tr>
        `;
    });

    tableBody.addEventListener('click', async (e) => {
        const target = e.target;
        if (target.classList.contains('btn-update-status')) {
            const orderId = target.dataset.orderId;
            const select = tableBody.querySelector(`select.status-select[data-order-id="${orderId}"]`);
            if (!orderId || !select) return;

            const order_status = select.value;

            target.disabled = true;
            target.textContent = 'Updating...';

            const updateRes = await api.admin_updateOrderStatus(orderId, order_status, token);
            if (updateRes.success) {
                alert('Order status updated successfully!');
            } else {
                alert(`Error updating: ${updateRes.message || 'Unknown error'}`);
            }
            target.disabled = false;
            target.textContent = 'Update';
        }
    });
}

function router() {
    const path = window.location.hash.substring(1) || 'admin_dashboard';
    const allowedAdminPages = ['admin_dashboard', 'admin_products', 'admin_orders', 'admin_users'];

    if (allowedAdminPages.includes(path)) {
        loadPage(path);

        const sidebarLinks = document.querySelectorAll('.admin-sidebar nav a');
        sidebarLinks.forEach(link => {
            if (link.getAttribute('href') === `#${path}`) {
                link.classList.add('active');
            } else {
                link.classList.remove('active');
            }
        });

    } else {
        console.warn(`Invalid admin route requested: ${path}`);
        loadPage('admin_dashboard');
    }
}

window.addEventListener('hashchange', router);
window.addEventListener('DOMContentLoaded', router);