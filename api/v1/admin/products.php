<?php
header("Content-Type: application/json; charset=UTF-8");

require_once '../config/database.php';
require_once '../middleware/AuthMiddleware.php';

$adminData = AuthMiddleware::checkAdmin();

$db = (new Database())->getConnection();
$method = $_SERVER['REQUEST_METHOD'];
$data = json_decode(file_get_contents("php://input"));
$response = ['success' => false, 'message' => 'An error occurred.'];

try {
    switch ($method) {
        case 'POST':
            if (isset($data->_method) && strtoupper($data->_method) == 'PUT') {
                goto UPDATE;
            }
            if (isset($data->_method) && strtoupper($data->_method) == 'DELETE') {
                goto DELETE;
            }

            CREATE:
            if (empty($data->product_name) || !isset($data->Price)) {
                http_response_code(400);
                $response['message'] = 'Product Name and Price are required.';
                echo json_encode($response);
                exit();
            }

            $sql = "INSERT INTO PRODUCTS (
                        product_name, Price, brand_id, category_id, type_id,
                        product_description, stock_quantity, stock_status, main_image
                    ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            $stmt = $db->prepare($sql);

            $stmt->execute([
                $data->product_name,
                $data->Price,
                isset($data->brand_id) && !empty($data->brand_id) ? $data->brand_id : null,
                isset($data->category_id) && !empty($data->category_id) ? $data->category_id : null,
                isset($data->type_id) && !empty($data->type_id) ? $data->type_id : null,
                $data->product_description ?? '',
                $data->stock_quantity ?? 0,
                $data->stock_status ?? 'in_stock',
                $data->main_image ?? null
            ]);

            http_response_code(201);
            $response = ['success' => true, 'message' => 'Product created successfully.', 'product_id' => $db->lastInsertId()];
            break;

        case 'GET':
            if (empty($_GET['id'])) {
                http_response_code(400);
                $response['message'] = 'Product ID is required.';
                echo json_encode($response);
                exit();
            }
            $id = filter_var($_GET['id'], FILTER_SANITIZE_NUMBER_INT);
            if (!$id || $id <= 0) {
                 http_response_code(400);
                 $response['message'] = 'Invalid Product ID.';
                 echo json_encode($response);
                 exit();
            }

            $stmt = $db->prepare("SELECT * FROM PRODUCTS WHERE product_id = ?");
            $stmt->execute([$id]);
            $product = $stmt->fetch(PDO::FETCH_ASSOC);

            if ($product) {
                http_response_code(200);
                $response = ['success' => true, 'data' => $product];
            } else {
                http_response_code(404);
                $response['message'] = 'Product not found.';
            }
            break;

        UPDATE:
            if (empty($data->product_id)) {
                http_response_code(400);
                $response['message'] = 'Product ID is required for update.';
                echo json_encode($response);
                exit();
            }
             if (empty($data->product_name) || !isset($data->Price)) {
                http_response_code(400);
                $response['message'] = 'Product Name and Price are required.';
                echo json_encode($response);
                exit();
            }

            $sql = "UPDATE PRODUCTS SET
                        product_name = ?, Price = ?, brand_id = ?, category_id = ?, type_id = ?,
                        product_description = ?, stock_quantity = ?, stock_status = ?, main_image = ?
                    WHERE product_id = ?";
            $stmt = $db->prepare($sql);

            $stmt->execute([
                $data->product_name,
                $data->Price,
                isset($data->brand_id) && !empty($data->brand_id) ? $data->brand_id : null,
                isset($data->category_id) && !empty($data->category_id) ? $data->category_id : null,
                isset($data->type_id) && !empty($data->type_id) ? $data->type_id : null,
                $data->product_description ?? '',
                $data->stock_quantity ?? 0,
                $data->stock_status ?? 'in_stock',
                $data->main_image ?? null,
                $data->product_id
            ]);

            http_response_code(200);
            $response = ['success' => true, 'message' => 'Product updated successfully.'];
            break;

        DELETE:
            if (empty($data->product_id)) {
                http_response_code(400);
                $response['message'] = 'Product ID is required for delete.';
                echo json_encode($response);
                exit();
            }
            $idToDelete = filter_var($data->product_id, FILTER_SANITIZE_NUMBER_INT);
             if (!$idToDelete || $idToDelete <= 0) {
                 http_response_code(400);
                 $response['message'] = 'Invalid Product ID for delete.';
                 echo json_encode($response);
                 exit();
            }

            $stmt = $db->prepare("DELETE FROM PRODUCTS WHERE product_id = ?");
            $stmt->execute([$idToDelete]);

            if ($stmt->rowCount() > 0) {
                 http_response_code(200);
                 $response = ['success' => true, 'message' => 'Product deleted successfully.'];
            } else {
                 http_response_code(404);
                 $response['message'] = 'Product not found or already deleted.';
            }
            break;

        default:
            http_response_code(405);
            $response['message'] = 'Method Not Allowed.';
            break;
    }

} catch (PDOException $e) {
    http_response_code(500);
    $response['message'] = 'Database Error: ' . $e->getMessage();
} catch (Exception $e) {
    http_response_code(500);
    $response['message'] = 'Server Error: ' . $e->getMessage();
}

echo json_encode($response);
?>