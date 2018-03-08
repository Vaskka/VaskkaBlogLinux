<?php
/*
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCY+d8U2ZEY6bb4yn3BoM8qRT3BJTcUqfz9kfR8KYCTovjnZgAB0jTxW/Xv1wqMMX2zF12tYcg1Dp7IPUr4A0PwKVHMNWv28BzLeDjgwT62QuuCpnjhijrF+n2s/sSiV5qDLV4+19XBNRf13uAdkW2ngvsQUz35Np2Juku5fgyrsuNkXZsQCGD7vW0TeE1RC4vhMcf4R48NkMwNGpc0kvnIVeQbZVfd4o/801D9FnIE/YlZ7s3Wt1GQpc7WvNpARxBUt0P3kf70JICZLG9ACkMxqlFOuOMlM7eWJd8/ks9Z+ntXSZ3IV/FbVyHywj697kSGfh9kAUUiZcg2pcmhrQ0R root@VM-16-13-ubuntu
';
*/
?>

<?php
// phpinfo();

defined('YII_DEBUG') or define('YII_DEBUG', true);
defined('YII_ENV') or define('YII_ENV', 'dev');

require(__DIR__ . '/../../vendor/autoload.php');
require(__DIR__ . '/../../vendor/yiisoft/yii2/Yii.php');
require(__DIR__ . '/../../common/config/bootstrap.php');
require(__DIR__ . '/../config/bootstrap.php');

$config = yii\helpers\ArrayHelper::merge(
    require(__DIR__ . '/../../common/config/main.php'),
    require(__DIR__ . '/../../common/config/main-local.php'),
    require(__DIR__ . '/../config/main.php'),
    require(__DIR__ . '/../config/main-local.php')
);

$application = new yii\web\Application($config);
$application->run();
