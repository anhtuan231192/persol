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
    const prevPageBtn = document.getElementById('btn-prev-page');
    const nextPageBtn = document.getElementById('btn-next-page');
    const pageInfo = document.getElementById('page-info');

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

    // Pagination variables
    let allProducts = [];
    let currentPage = 1;
    const itemsPerPage = 10;

    function renderTable(products) {
        tableBody.innerHTML = '';
        if (!products || products.length === 0) {
            tableBody.innerHTML = '<tr><td colspan="5">No products found.</td></tr>';
            return;
        }
        products.forEach(p => {
            tableBody.innerHTML += `
                <tr data-id="${p.product_id}">
                    <td>${p.product_id}</td>
                    <td>${p.product_name || 'N/A'}</td>
                    <td>$${p.Price ? parseFloat(p.Price).toFixed(2) : '0.00'}</td>
                    <td>
                        <button class="btn-upload-doc" data-product-id="${p.product_id}">Upload Doc</button>
                    </td>
                    <td>
                        <button class="btn-edit" data-product-id="${p.product_id}">Edit</button>
                        <button class="btn-delete" data-product-id="${p.product_id}">Delete</button>
                    </td>
                </tr>
            `;
        });
    }

    function renderPage(page) {
        const startIndex = (page - 1) * itemsPerPage;
        const endIndex = startIndex + itemsPerPage;
        const pageProducts = allProducts.slice(startIndex, endIndex);

        renderTable(pageProducts);

        // Update pagination controls
        const totalPages = Math.ceil(allProducts.length / itemsPerPage);
        if (pageInfo) {
            pageInfo.textContent = `Page ${page} of ${totalPages}`;
        }

        if (prevPageBtn) {
            prevPageBtn.disabled = page === 1;
        }

        if (nextPageBtn) {
            nextPageBtn.disabled = page >= totalPages;
        }
    }

    if (productsRes && productsRes.success && productsRes.data) {
        allProducts = productsRes.data;
        renderPage(currentPage);
    } else {
        tableBody.innerHTML = `<tr><td colspan="4">Error loading product list: ${productsRes ? productsRes.message : 'API Error'}</td></tr>`;
    }

    // Pagination event listeners
    if (prevPageBtn) {
        prevPageBtn.addEventListener('click', () => {
            if (currentPage > 1) {
                currentPage--;
                renderPage(currentPage);
            }
        });
    }

    if (nextPageBtn) {
        nextPageBtn.addEventListener('click', () => {
            const totalPages = Math.ceil(allProducts.length / itemsPerPage);
            if (currentPage < totalPages) {
                currentPage++;
                renderPage(currentPage);
            }
        });
    }

    // Image preview functionality
    const productImageInput = document.getElementById('product_image');
    const previewImg = document.getElementById('preview-img');

    if (productImageInput && previewImg) {
        productImageInput.addEventListener('change', (e) => {
            const file = e.target.files[0];
            if (file) {
                // Validate file type
                const allowedTypes = ['image/jpeg', 'image/png', 'image/gif', 'image/webp'];
                if (!allowedTypes.includes(file.type)) {
                    alert('Invalid file type. Only JPG, PNG, GIF, and WEBP images are allowed.');
                    productImageInput.value = '';
                    previewImg.style.display = 'none';
                    return;
                }

                // Validate file size (5MB)
                const maxSize = 5 * 1024 * 1024; // 5MB
                if (file.size > maxSize) {
                    alert('File size exceeds 5MB limit.');
                    productImageInput.value = '';
                    previewImg.style.display = 'none';
                    return;
                }

                // Show preview
                const reader = new FileReader();
                reader.onload = (e) => {
                    previewImg.src = e.target.result;
                    previewImg.style.display = 'block';
                };
                reader.readAsDataURL(file);
            } else {
                previewImg.style.display = 'none';
            }
        });
    }

    showAddFormBtn.addEventListener('click', () => {
        form.reset();
        document.getElementById('product_id').value = '';
        if (previewImg) previewImg.style.display = 'none';
        form.style.display = 'block';
    });

    cancelEditBtn.addEventListener('click', () => {
        form.style.display = 'none';
        form.reset();
        if (previewImg) previewImg.style.display = 'none';
    });

    // Document upload functionality
    const documentUploadSection = document.getElementById('document-upload-section');
    const uploadProductIdInput = document.getElementById('upload_product_id');
    const documentFileInput = document.getElementById('document_file');
    const btnUploadDocument = document.getElementById('btn-upload-document');
    const btnCancelUpload = document.getElementById('btn-cancel-upload');
    const uploadStatus = document.getElementById('upload-status');

    if (btnCancelUpload) {
        btnCancelUpload.addEventListener('click', () => {
            if (documentUploadSection) documentUploadSection.style.display = 'none';
            if (documentFileInput) documentFileInput.value = '';
            if (uploadStatus) uploadStatus.textContent = '';
        });
    }

    if (btnUploadDocument) {
        btnUploadDocument.addEventListener('click', async () => {
            const productId = uploadProductIdInput?.value;
            const file = documentFileInput?.files[0];

            if (!productId) {
                alert('Product ID is missing.');
                return;
            }

            if (!file) {
                alert('Please select a document file to upload.');
                return;
            }

            // Validate file type
            const allowedExtensions = ['pdf', 'txt', 'docx', 'doc'];
            const fileName = file.name.toLowerCase();
            const fileExtension = fileName.split('.').pop();

            if (!allowedExtensions.includes(fileExtension)) {
                alert('Invalid file type. Only PDF, TXT, and DOCX files are allowed.');
                return;
            }

            // Validate file size (10MB max)
            const maxSize = 10 * 1024 * 1024; // 10MB
            if (file.size > maxSize) {
                alert('File size exceeds 10MB limit.');
                return;
            }

            btnUploadDocument.disabled = true;
            btnUploadDocument.textContent = 'Uploading...';
            if (uploadStatus) uploadStatus.textContent = 'Uploading document...';

            const res = await api.admin_uploadDocument(productId, file, token);

            if (res.success) {
                alert(`Document "${res.filename}" uploaded successfully!`);
                if (documentUploadSection) documentUploadSection.style.display = 'none';
                if (documentFileInput) documentFileInput.value = '';
                if (uploadStatus) uploadStatus.textContent = '';
            } else {
                alert(`Upload failed: ${res.message || 'Unknown error'}`);
                if (uploadStatus) uploadStatus.textContent = `Error: ${res.message || 'Unknown error'}`;
            }

            btnUploadDocument.disabled = false;
            btnUploadDocument.textContent = 'Upload Document';
        });
    }

    tableBody.addEventListener('click', async (e) => {
        const target = e.target;
        const productId = target.dataset.productId;

        if (!productId) return;

        if (target.classList.contains('btn-upload-doc')) {
            // Show document upload section
            if (uploadProductIdInput) uploadProductIdInput.value = productId;
            if (documentUploadSection) documentUploadSection.style.display = 'block';
            if (documentFileInput) documentFileInput.value = '';
            if (uploadStatus) uploadStatus.textContent = '';

            // Scroll to upload section
            documentUploadSection?.scrollIntoView({ behavior: 'smooth', block: 'nearest' });
        }

        if (target.classList.contains('btn-delete')) {
            if (confirm(`Are you sure you want to delete product ID: ${productId}? This action cannot be undone.`)) {
                target.disabled = true;
                target.textContent = 'Deleting...';
                const res = await api.admin_deleteProduct(productId, token);
                if (res.success) {
                    alert('Deleted successfully!');
                    // Remove from allProducts array
                    allProducts = allProducts.filter(p => p.product_id != productId);
                    // Adjust current page if needed
                    const totalPages = Math.ceil(allProducts.length / itemsPerPage);
                    if (currentPage > totalPages && currentPage > 1) {
                        currentPage = totalPages;
                    }
                    // Re-render the current page
                    renderPage(currentPage);
                } else {
                    alert(`Error deleting product: ${res.message || 'Unknown error'}`);
                    target.disabled = false;
                    target.textContent = 'Delete';
                }
            }
        }

if (target.classList.contains('btn-edit')) {
            const product = allProducts.find(p => p.product_id == productId);

            if (product) {
                document.getElementById('product_id').value = product.product_id;
                document.getElementById('product_name').value = product.product_name || '';
                document.getElementById('product_price').value = product.Price || '';
                document.getElementById('product_brand').value = product.brand_id || '';
                document.getElementById('product_category').value = product.category_id || '';
                document.getElementById('product_description').value = product.product_description || '';
                document.getElementById('product_quantity').value = product.stock_quantity || '';

                const productImageInput = document.getElementById('product_image');
                const previewImg = document.getElementById('preview-img');

                if (productImageInput) {
                    productImageInput.value = '';
                }

                if (previewImg) {
                    if (product.main_image) {
                        previewImg.src = `uploads/product_images/${product.main_image}`;
                        previewImg.style.display = 'block';
                    } else {
                        previewImg.src = '';
                        previewImg.style.display = 'none';
                    }
                }

                form.style.display = 'block';
                form.scrollIntoView({ behavior: 'smooth', block: 'start' });

            } else {
                 alert('Product data not found for editing.');
            }
            return;
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
            stock_quantity: document.getElementById('product_quantity').value || 0
        };

        const imageFile = productImageInput?.files[0];

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
            // If image is selected, upload it
            if (imageFile) {
                submitButton.textContent = 'Uploading image...';
                const productId = productData.product_id || res.product_id;
                const imageRes = await api.admin_uploadProductImage(productId, imageFile, token);

                if (!imageRes.success) {
                    alert(`Product saved but image upload failed: ${imageRes.message || 'Unknown error'}`);
                }
            }

            alert('Product saved successfully!');
            form.style.display = 'none';
            form.reset();
            if (previewImg) previewImg.style.display = 'none';
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
    const prevPageBtn = document.getElementById('btn-prev-page-orders');
    const nextPageBtn = document.getElementById('btn-next-page-orders');
    const pageInfo = document.getElementById('page-info-orders');

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

    // Pagination variables
    let allOrders = res.data;
    let currentPage = 1;
    const itemsPerPage = 10;

    function renderTable(orders) {
        tableBody.innerHTML = '';
        if (!orders || orders.length === 0) {
            tableBody.innerHTML = '<tr><td colspan="6">No orders found.</td></tr>';
            return;
        }

        orders.forEach(order => {
            tableBody.innerHTML += `
                <tr data-order-id="${order.order_id}">
                    <td>${order.order_code || 'N/A'}</td>
                    <td>${order.customer_name || 'Guest'}</td>
                    <td>${order.created_at ? new Date(order.created_at).toLocaleDateString('en-US') : 'N/A'}</td>
                    <td>$${order.total_amount ? parseFloat(order.total_amount).toFixed(2) : '0.00'}</td>
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
    }

    function renderPage(page) {
        const startIndex = (page - 1) * itemsPerPage;
        const endIndex = startIndex + itemsPerPage;
        const pageOrders = allOrders.slice(startIndex, endIndex);

        renderTable(pageOrders);

        // Update pagination controls
        const totalPages = Math.ceil(allOrders.length / itemsPerPage);
        if (pageInfo) {
            pageInfo.textContent = `Page ${page} of ${totalPages}`;
        }

        if (prevPageBtn) {
            prevPageBtn.disabled = page === 1;
        }

        if (nextPageBtn) {
            nextPageBtn.disabled = page >= totalPages;
        }
    }

    // Initial render
    if (allOrders.length === 0) {
        tableBody.innerHTML = '<tr><td colspan="6">No orders found.</td></tr>';
    } else {
        renderPage(currentPage);
    }

    // Pagination event listeners
    if (prevPageBtn) {
        prevPageBtn.addEventListener('click', () => {
            if (currentPage > 1) {
                currentPage--;
                renderPage(currentPage);
            }
        });
    }

    if (nextPageBtn) {
        nextPageBtn.addEventListener('click', () => {
            const totalPages = Math.ceil(allOrders.length / itemsPerPage);
            if (currentPage < totalPages) {
                currentPage++;
                renderPage(currentPage);
            }
        });
    }

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
                // Update the order in allOrders array
                const orderIndex = allOrders.findIndex(o => o.order_id == orderId);
                if (orderIndex !== -1) {
                    allOrders[orderIndex].order_status = order_status;
                }
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