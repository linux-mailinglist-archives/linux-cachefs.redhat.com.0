Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 217E54F724F
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Apr 2022 04:50:30 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-459-RkYxkbr8NHy001NTKPl5Wg-1; Wed, 06 Apr 2022 22:50:28 -0400
X-MC-Unique: RkYxkbr8NHy001NTKPl5Wg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 82D40185A79C;
	Thu,  7 Apr 2022 02:50:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7894340CF910;
	Thu,  7 Apr 2022 02:50:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3B55C194036B;
	Thu,  7 Apr 2022 02:50:27 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id ED9D6194034B for <linux-cachefs@listman.corp.redhat.com>;
 Thu,  7 Apr 2022 02:50:25 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E011C400E873; Thu,  7 Apr 2022 02:50:25 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DBB0F40CF910
 for <linux-cachefs@redhat.com>; Thu,  7 Apr 2022 02:50:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B253F1C0170B
 for <linux-cachefs@redhat.com>; Thu,  7 Apr 2022 02:50:25 +0000 (UTC)
Received: from out199-8.us.a.mail.aliyun.com (out199-8.us.a.mail.aliyun.com
 [47.90.199.8]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-106-xzLMYVSFM1aGZEn4Yq2rUA-1; Wed, 06 Apr 2022 22:50:23 -0400
X-MC-Unique: xzLMYVSFM1aGZEn4Yq2rUA-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R161e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e01424; MF=hsiangkao@linux.alibaba.com;
 NM=1; PH=DS; RN=19; SR=0; TI=SMTPD_---0V9Onnyg_1649299816
Received: from B-P7TQMD6M-0146.local(mailfrom:hsiangkao@linux.alibaba.com
 fp:SMTPD_---0V9Onnyg_1649299816) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 07 Apr 2022 10:50:18 +0800
Date: Thu, 7 Apr 2022 10:50:16 +0800
From: Gao Xiang <hsiangkao@linux.alibaba.com>
To: Jeffle Xu <jefflexu@linux.alibaba.com>
Message-ID: <Yk5RaIdjg8fd3YQR@B-P7TQMD6M-0146.local>
Mail-Followup-To: Jeffle Xu <jefflexu@linux.alibaba.com>,
 dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
 chao@kernel.org, linux-erofs@lists.ozlabs.org,
 torvalds@linux-foundation.org, gregkh@linuxfoundation.org,
 willy@infradead.org, linux-fsdevel@vger.kernel.org,
 joseph.qi@linux.alibaba.com, bo.liu@linux.alibaba.com,
 tao.peng@linux.alibaba.com, gerry@linux.alibaba.com,
 eguan@linux.alibaba.com, linux-kernel@vger.kernel.org,
 luodaowen.backend@bytedance.com, tianzichen@kuaishou.com,
 fannaihao@baidu.com
References: <20220406075612.60298-1-jefflexu@linux.alibaba.com>
 <20220406075612.60298-11-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <20220406075612.60298-11-jefflexu@linux.alibaba.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Mimecast-Bulk-Signature: yes
X-Mimecast-Spam-Signature: bulk
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: Re: [Linux-cachefs] [PATCH v8 10/20] erofs: register fscache volume
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
 linux-cachefs@redhat.com, bo.liu@linux.alibaba.com, gregkh@linuxfoundation.org,
 linux-fsdevel@vger.kernel.org, luodaowen.backend@bytedance.com,
 xiang@kernel.org, gerry@linux.alibaba.com, torvalds@linux-foundation.org,
 eguan@linux.alibaba.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Apr 06, 2022 at 03:56:02PM +0800, Jeffle Xu wrote:
> A new fscache based mode is going to be introduced for erofs, in which
> case on-demand read semantics is implemented through fscache.
> 
> As the first step, register fscache volume for each erofs filesystem.
> That means, data blobs can not be shared among erofs filesystems. In the
> following iteration, we are going to introduce the domain semantics, in
> which case several erofs filesystems can belong to one domain, and data
> blobs can be shared among these erofs filesystems of one domain.
> 
> Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>

Reviewed-by: Gao Xiang <hsiangkao@linux.alibaba.com>

Thanks,
Gao Xiang

> ---
>  fs/erofs/Kconfig    | 10 ++++++++++
>  fs/erofs/Makefile   |  1 +
>  fs/erofs/fscache.c  | 37 +++++++++++++++++++++++++++++++++++++
>  fs/erofs/internal.h | 13 +++++++++++++
>  fs/erofs/super.c    |  7 +++++++
>  5 files changed, 68 insertions(+)
>  create mode 100644 fs/erofs/fscache.c
> 
> diff --git a/fs/erofs/Kconfig b/fs/erofs/Kconfig
> index f57255ab88ed..3d05265e3e8e 100644
> --- a/fs/erofs/Kconfig
> +++ b/fs/erofs/Kconfig
> @@ -98,3 +98,13 @@ config EROFS_FS_ZIP_LZMA
>  	  systems will be readable without selecting this option.
>  
>  	  If unsure, say N.
> +
> +config EROFS_FS_ONDEMAND
> +	bool "EROFS fscache-based ondemand-read"
> +	depends on CACHEFILES_ONDEMAND && (EROFS_FS=m && FSCACHE || EROFS_FS=y && FSCACHE=y)
> +	default n
> +	help
> +	  EROFS is mounted from data blobs and on-demand read semantics is
> +	  implemented through fscache.
> +
> +	  If unsure, say N.
> diff --git a/fs/erofs/Makefile b/fs/erofs/Makefile
> index 8a3317e38e5a..99bbc597a3e9 100644
> --- a/fs/erofs/Makefile
> +++ b/fs/erofs/Makefile
> @@ -5,3 +5,4 @@ erofs-objs := super.o inode.o data.o namei.o dir.o utils.o pcpubuf.o sysfs.o
>  erofs-$(CONFIG_EROFS_FS_XATTR) += xattr.o
>  erofs-$(CONFIG_EROFS_FS_ZIP) += decompressor.o zmap.o zdata.o
>  erofs-$(CONFIG_EROFS_FS_ZIP_LZMA) += decompressor_lzma.o
> +erofs-$(CONFIG_EROFS_FS_ONDEMAND) += fscache.o
> diff --git a/fs/erofs/fscache.c b/fs/erofs/fscache.c
> new file mode 100644
> index 000000000000..7a6d0239ebb1
> --- /dev/null
> +++ b/fs/erofs/fscache.c
> @@ -0,0 +1,37 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2022, Alibaba Cloud
> + */
> +#include <linux/fscache.h>
> +#include "internal.h"
> +
> +int erofs_fscache_register_fs(struct super_block *sb)
> +{
> +	struct erofs_sb_info *sbi = EROFS_SB(sb);
> +	struct fscache_volume *volume;
> +	char *name;
> +	int ret = 0;
> +
> +	name = kasprintf(GFP_KERNEL, "erofs,%s", sbi->opt.fsid);
> +	if (!name)
> +		return -ENOMEM;
> +
> +	volume = fscache_acquire_volume(name, NULL, NULL, 0);
> +	if (IS_ERR_OR_NULL(volume)) {
> +		erofs_err(sb, "failed to register volume for %s", name);
> +		ret = volume ? PTR_ERR(volume) : -EOPNOTSUPP;
> +		volume = NULL;
> +	}
> +
> +	sbi->volume = volume;
> +	kfree(name);
> +	return ret;
> +}
> +
> +void erofs_fscache_unregister_fs(struct super_block *sb)
> +{
> +	struct erofs_sb_info *sbi = EROFS_SB(sb);
> +
> +	fscache_relinquish_volume(sbi->volume, NULL, false);
> +	sbi->volume = NULL;
> +}
> diff --git a/fs/erofs/internal.h b/fs/erofs/internal.h
> index 05a97533b1e9..952a2f483f94 100644
> --- a/fs/erofs/internal.h
> +++ b/fs/erofs/internal.h
> @@ -74,6 +74,7 @@ struct erofs_mount_opts {
>  	unsigned int max_sync_decompress_pages;
>  #endif
>  	unsigned int mount_opt;
> +	char *fsid;
>  };
>  
>  struct erofs_dev_context {
> @@ -146,6 +147,9 @@ struct erofs_sb_info {
>  	/* sysfs support */
>  	struct kobject s_kobj;		/* /sys/fs/erofs/<devname> */
>  	struct completion s_kobj_unregister;
> +
> +	/* fscache support */
> +	struct fscache_volume *volume;
>  };
>  
>  #define EROFS_SB(sb) ((struct erofs_sb_info *)(sb)->s_fs_info)
> @@ -618,6 +622,15 @@ static inline int z_erofs_load_lzma_config(struct super_block *sb,
>  }
>  #endif	/* !CONFIG_EROFS_FS_ZIP */
>  
> +/* fscache.c */
> +#ifdef CONFIG_EROFS_FS_ONDEMAND
> +int erofs_fscache_register_fs(struct super_block *sb);
> +void erofs_fscache_unregister_fs(struct super_block *sb);
> +#else
> +static inline int erofs_fscache_register_fs(struct super_block *sb) { return 0; }
> +static inline void erofs_fscache_unregister_fs(struct super_block *sb) {}
> +#endif
> +
>  #define EFSCORRUPTED    EUCLEAN         /* Filesystem is corrupted */
>  
>  #endif	/* __EROFS_INTERNAL_H */
> diff --git a/fs/erofs/super.c b/fs/erofs/super.c
> index 0c4b41130c2f..6590ed1b7d3b 100644
> --- a/fs/erofs/super.c
> +++ b/fs/erofs/super.c
> @@ -601,6 +601,12 @@ static int erofs_fc_fill_super(struct super_block *sb, struct fs_context *fc)
>  	sbi->devs = ctx->devs;
>  	ctx->devs = NULL;
>  
> +	if (erofs_is_fscache_mode(sb)) {
> +		err = erofs_fscache_register_fs(sb);
> +		if (err)
> +			return err;
> +	}
> +
>  	err = erofs_read_superblock(sb);
>  	if (err)
>  		return err;
> @@ -757,6 +763,7 @@ static void erofs_kill_sb(struct super_block *sb)
>  
>  	erofs_free_dev_context(sbi->devs);
>  	fs_put_dax(sbi->dax_dev);
> +	erofs_fscache_unregister_fs(sb);
>  	kfree(sbi);
>  	sb->s_fs_info = NULL;
>  }
> -- 
> 2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

