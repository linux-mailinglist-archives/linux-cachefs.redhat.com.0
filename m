Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6635750997D
	for <lists+linux-cachefs@lfdr.de>; Thu, 21 Apr 2022 09:53:24 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-498-AJl1sfzuPJGEv_varFfsQA-1; Thu, 21 Apr 2022 03:53:20 -0400
X-MC-Unique: AJl1sfzuPJGEv_varFfsQA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D24883C0D194;
	Thu, 21 Apr 2022 07:53:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5F53D403178;
	Thu, 21 Apr 2022 07:53:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 18BA8194034A;
	Thu, 21 Apr 2022 07:53:17 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 46D1B1949763 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 21 Apr 2022 07:53:16 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0DED440316C; Thu, 21 Apr 2022 07:53:16 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 09C8E416360
 for <linux-cachefs@redhat.com>; Thu, 21 Apr 2022 07:53:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E50853C0D199
 for <linux-cachefs@redhat.com>; Thu, 21 Apr 2022 07:53:15 +0000 (UTC)
Received: from out199-16.us.a.mail.aliyun.com
 (out199-16.us.a.mail.aliyun.com [47.90.199.16]) by relay.mimecast.com with
 ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-402-tIG9Mh-rM0m0wgtjhD-jEg-1; Thu, 21 Apr 2022 03:53:13 -0400
X-MC-Unique: tIG9Mh-rM0m0wgtjhD-jEg-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R151e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04357; MF=hsiangkao@linux.alibaba.com;
 NM=1; PH=DS; RN=20; SR=0; TI=SMTPD_---0VAdmSw9_1650527585
Received: from B-P7TQMD6M-0146.local(mailfrom:hsiangkao@linux.alibaba.com
 fp:SMTPD_---0VAdmSw9_1650527585) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 21 Apr 2022 15:53:08 +0800
Date: Thu, 21 Apr 2022 15:53:05 +0800
From: Gao Xiang <hsiangkao@linux.alibaba.com>
To: Jeffle Xu <jefflexu@linux.alibaba.com>
Message-ID: <YmENYam/pVJ+Riyy@B-P7TQMD6M-0146.local>
Mail-Followup-To: Jeffle Xu <jefflexu@linux.alibaba.com>,
 dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
 chao@kernel.org, linux-erofs@lists.ozlabs.org,
 torvalds@linux-foundation.org, gregkh@linuxfoundation.org,
 willy@infradead.org, linux-fsdevel@vger.kernel.org,
 joseph.qi@linux.alibaba.com, bo.liu@linux.alibaba.com,
 tao.peng@linux.alibaba.com, gerry@linux.alibaba.com,
 eguan@linux.alibaba.com, linux-kernel@vger.kernel.org,
 luodaowen.backend@bytedance.com, tianzichen@kuaishou.com,
 fannaihao@baidu.com, zhangjiachen.jaycee@bytedance.com
References: <20220415123614.54024-1-jefflexu@linux.alibaba.com>
 <20220415123614.54024-11-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <20220415123614.54024-11-jefflexu@linux.alibaba.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: Re: [Linux-cachefs] [PATCH v9 10/21] erofs: add fscache mode check
 helper
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: tianzichen@kuaishou.com, linux-erofs@lists.ozlabs.org, chao@kernel.org,
 fannaihao@baidu.com, tao.peng@linux.alibaba.com, willy@infradead.org,
 linux-kernel@vger.kernel.org, joseph.qi@linux.alibaba.com,
 zhangjiachen.jaycee@bytedance.com, linux-cachefs@redhat.com,
 bo.liu@linux.alibaba.com, gregkh@linuxfoundation.org,
 linux-fsdevel@vger.kernel.org, luodaowen.backend@bytedance.com,
 xiang@kernel.org, gerry@linux.alibaba.com, torvalds@linux-foundation.org,
 eguan@linux.alibaba.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Apr 15, 2022 at 08:36:03PM +0800, Jeffle Xu wrote:
> Until then erofs is exactly blockdev based filesystem.
> 
> A new fscache-based mode is going to be introduced for erofs to support
> scenarios where on-demand read semantics is needed, e.g. container
> image distribution. In this case, erofs could be mounted from data blobs
> through fscache.
> 
> Add a helper checking which mode erofs works in, and twist the code in
> prep for the following fscache mode.

in preparation for the upcoming fscache mode.

> 
> Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>

Reviewed-by: Gao Xiang <hsiangkao@linux.alibaba.com>

Thanks,
Gao Xiang

> ---
>  fs/erofs/internal.h |  5 +++++
>  fs/erofs/super.c    | 44 +++++++++++++++++++++++++++++---------------
>  2 files changed, 34 insertions(+), 15 deletions(-)
> 
> diff --git a/fs/erofs/internal.h b/fs/erofs/internal.h
> index fe9564e5091e..05a97533b1e9 100644
> --- a/fs/erofs/internal.h
> +++ b/fs/erofs/internal.h
> @@ -161,6 +161,11 @@ struct erofs_sb_info {
>  #define set_opt(opt, option)	((opt)->mount_opt |= EROFS_MOUNT_##option)
>  #define test_opt(opt, option)	((opt)->mount_opt & EROFS_MOUNT_##option)
>  
> +static inline bool erofs_is_fscache_mode(struct super_block *sb)
> +{
> +	return IS_ENABLED(CONFIG_EROFS_FS_ONDEMAND) && !sb->s_bdev;
> +}
> +
>  enum {
>  	EROFS_ZIP_CACHE_DISABLED,
>  	EROFS_ZIP_CACHE_READAHEAD,
> diff --git a/fs/erofs/super.c b/fs/erofs/super.c
> index 0c4b41130c2f..724d5ff0d78c 100644
> --- a/fs/erofs/super.c
> +++ b/fs/erofs/super.c
> @@ -259,15 +259,19 @@ static int erofs_init_devices(struct super_block *sb,
>  		}
>  		dis = ptr + erofs_blkoff(pos);
>  
> -		bdev = blkdev_get_by_path(dif->path,
> -					  FMODE_READ | FMODE_EXCL,
> -					  sb->s_type);
> -		if (IS_ERR(bdev)) {
> -			err = PTR_ERR(bdev);
> -			break;
> +		if (!erofs_is_fscache_mode(sb)) {
> +			bdev = blkdev_get_by_path(dif->path,
> +						  FMODE_READ | FMODE_EXCL,
> +						  sb->s_type);
> +			if (IS_ERR(bdev)) {
> +				err = PTR_ERR(bdev);
> +				break;
> +			}
> +			dif->bdev = bdev;
> +			dif->dax_dev = fs_dax_get_by_bdev(bdev,
> +							  &dif->dax_part_off);
>  		}
> -		dif->bdev = bdev;
> -		dif->dax_dev = fs_dax_get_by_bdev(bdev, &dif->dax_part_off);
> +
>  		dif->blocks = le32_to_cpu(dis->blocks);
>  		dif->mapped_blkaddr = le32_to_cpu(dis->mapped_blkaddr);
>  		sbi->total_blocks += dif->blocks;
> @@ -586,21 +590,28 @@ static int erofs_fc_fill_super(struct super_block *sb, struct fs_context *fc)
>  
>  	sb->s_magic = EROFS_SUPER_MAGIC;
>  
> -	if (!sb_set_blocksize(sb, EROFS_BLKSIZ)) {
> -		erofs_err(sb, "failed to set erofs blksize");
> -		return -EINVAL;
> -	}
> -
>  	sbi = kzalloc(sizeof(*sbi), GFP_KERNEL);
>  	if (!sbi)
>  		return -ENOMEM;
>  
>  	sb->s_fs_info = sbi;
>  	sbi->opt = ctx->opt;
> -	sbi->dax_dev = fs_dax_get_by_bdev(sb->s_bdev, &sbi->dax_part_off);
>  	sbi->devs = ctx->devs;
>  	ctx->devs = NULL;
>  
> +	if (erofs_is_fscache_mode(sb)) {
> +		sb->s_blocksize = EROFS_BLKSIZ;
> +		sb->s_blocksize_bits = LOG_BLOCK_SIZE;
> +	} else {
> +		if (!sb_set_blocksize(sb, EROFS_BLKSIZ)) {
> +			erofs_err(sb, "failed to set erofs blksize");
> +			return -EINVAL;
> +		}
> +
> +		sbi->dax_dev = fs_dax_get_by_bdev(sb->s_bdev,
> +						  &sbi->dax_part_off);
> +	}
> +
>  	err = erofs_read_superblock(sb);
>  	if (err)
>  		return err;
> @@ -857,7 +868,10 @@ static int erofs_statfs(struct dentry *dentry, struct kstatfs *buf)
>  {
>  	struct super_block *sb = dentry->d_sb;
>  	struct erofs_sb_info *sbi = EROFS_SB(sb);
> -	u64 id = huge_encode_dev(sb->s_bdev->bd_dev);
> +	u64 id = 0;
> +
> +	if (!erofs_is_fscache_mode(sb))
> +		id = huge_encode_dev(sb->s_bdev->bd_dev);
>  
>  	buf->f_type = sb->s_magic;
>  	buf->f_bsize = EROFS_BLKSIZ;
> -- 
> 2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

