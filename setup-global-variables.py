# TENSORFLOW
# 0 = all messages are logged (default behavior)
# 1 = INFO messages are not printed
# 2 = INFO and WARNING messages are not printed
# 3 = INFO, WARNING, and ERROR messages are not printed
os.environ['TF_CPP_MIN_LOG_LEVEL'] = '3'

# NVIDIA GPU
# Specifing the device, which will be used for calculations
# '-1' - using CPU
# '0' or 'n' - use 0-th or n-th GPU
# '0, 1, 3' - use 0-th, 1-st and 3-rd GPU devices
# etc.
os.environ['CUDA_VISIBLE_DEVICES'] = '0' # do it before importing tf, keras and etc.
numba.cuda.select_device(0)
tensorflow.test.is_gpu_available()
tensorflow.test.gpu_device_name()
def get_available_gpus():
    local_device_protos = tensorflow.python.client.device_lib.list_local_devices()
    return [x.name for x in local_device_protos if x.device_type == 'GPU']
n = str(subprocess.check_output(["nvidia-smi", "-L"])).count('UUID')
numba.cuda.close() # after this you can not open GPU device in this python process
