# sync rom
repo init --depth=1 --no-repo-verify -u https://github.com/Spark-Rom/manifest -b spark -g default,-mips,-darwin,-notdefault
git clone https://github.com/NFS-projects/local_manifest --depth 1 -b spark .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8
git clone https://github.com/AOSPA/android_device_sony_kugo device/Sony/kugo
git clone https://github.com/ExplosiveLobster/platform_vendor_sony_loire vendor/sony/loire
git clone https://github.com/ExplosiveLobster/kernel_sony_msm-4.9/ kernel/sony/kugo

# build rom
source build/envsetup.sh
lunch aosp_f5321-eng
export TZ=Asia/Jakarta
export BUILD_USERNAME=rosy
export BUILD_HOSTNAME=userngebug
mka -k 

# end
