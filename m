Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A14204F7362
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Apr 2022 05:25:46 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-60-O7g9SK5LO9eyGIcnIk-HJA-1; Wed, 06 Apr 2022 23:25:43 -0400
X-MC-Unique: O7g9SK5LO9eyGIcnIk-HJA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 468A885A5BE;
	Thu,  7 Apr 2022 03:25:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3635641617F;
	Thu,  7 Apr 2022 03:25:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id EE1D0194034E;
	Thu,  7 Apr 2022 03:25:41 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 17D031949763 for <linux-cachefs@listman.corp.redhat.com>;
 Thu,  7 Apr 2022 03:25:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 060ED145BA42; Thu,  7 Apr 2022 03:25:40 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0124D145BA41
 for <linux-cachefs@redhat.com>; Thu,  7 Apr 2022 03:25:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DAB83802809
 for <linux-cachefs@redhat.com>; Thu,  7 Apr 2022 03:25:39 +0000 (UTC)
Received: from out30-44.freemail.mail.aliyun.com
 (out30-44.freemail.mail.aliyun.com [115.124.30.44]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-205-mO6wSTHMP2Cjprjh8XG8qw-1; Wed, 06 Apr 2022 23:25:38 -0400
X-MC-Unique: mO6wSTHMP2Cjprjh8XG8qw-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R111e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04395; MF=hsiangkao@linux.alibaba.com;
 NM=1; PH=DS; RN=19; SR=0; TI=SMTPD_---0V9OcA4p_1649301930
Received: from B-P7TQMD6M-0146.local(mailfrom:hsiangkao@linux.alibaba.com
 fp:SMTPD_---0V9OcA4p_1649301930) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 07 Apr 2022 11:25:33 +0800
Date: Thu, 7 Apr 2022 11:25:29 +0800
From: Gao Xiang <hsiangkao@linux.alibaba.com>
To: Jeffle Xu <jefflexu@linux.alibaba.com>
Message-ID: <Yk5ZqX4JkWbyAKdH@B-P7TQMD6M-0146.local>
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
 <20220406075612.60298-12-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <20220406075612.60298-12-jefflexu@linux.alibaba.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: Re: [Linux-cachefs] [PATCH v8 11/20] erofs: add fscache context
 helper functions
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Apr 06, 2022 at 03:56:03PM +0800, Jeffle Xu wrote:
> Introduce a context structure for managing data blobs, and helper
> functions for initializing and cleaning up this context structure.
> 
> Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>

Reviewed-by: Gao Xiang <hsiangkao@linux.alibaba.com>

Thanks,
Gao Xiang

> ---
>  fs/erofs/fscache.c  | 46 +++++++++++++++++++++++++++++++++++++++++++++
>  fs/erofs/internal.h | 19 +++++++++++++++++++
>  2 files changed, 65 insertions(+)
> 
> diff --git a/fs/erofs/fscache.c b/fs/erofs/fscache.c
> index 7a6d0239ebb1..67a3c4935245 100644
> --- a/fs/erofs/fscache.c
> +++ b/fs/erofs/fscache.c
> @@ -5,6 +5,52 @@
>  #include <linux/fscache.h>
>  #include "internal.h"
>  
> +/*
> + * Create an fscache context for data blob.
> + * Return: 0 on success and allocated fscache context is assigned to @fscache,
> + *	   negative error number on failure.
> + */
> +int erofs_fscache_register_cookie(struct super_block *sb,
> +				  struct erofs_fscache **fscache, char *name)
> +{
> +	struct fscache_volume *volume = EROFS_SB(sb)->volume;
> +	struct erofs_fscache *ctx;
> +	struct fscache_cookie *cookie;
> +
> +	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	cookie = fscache_acquire_cookie(volume, FSCACHE_ADV_WANT_CACHE_SIZE,
> +					name, strlen(name), NULL, 0, 0);
> +	if (!cookie) {
> +		erofs_err(sb, "failed to get cookie for %s", name);
> +		kfree(name);
> +		return -EINVAL;
> +	}
> +
> +	fscache_use_cookie(cookie, false);
> +	ctx->cookie = cookie;
> +
> +	*fscache = ctx;
> +	return 0;
> +}
> +
> +void erofs_fscache_unregister_cookie(struct erofs_fscache **fscache)
> +{
> +	struct erofs_fscache *ctx = *fscache;
> +
> +	if (!ctx)
> +		return;
> +
> +	fscache_unuse_cookie(ctx->cookie, NULL, NULL);
> +	fscache_relinquish_cookie(ctx->cookie, false);
> +	ctx->cookie = NULL;
> +
> +	kfree(ctx);
> +	*fscache = NULL;
> +}
> +
>  int erofs_fscache_register_fs(struct super_block *sb)
>  {
>  	struct erofs_sb_info *sbi = EROFS_SB(sb);
> diff --git a/fs/erofs/internal.h b/fs/erofs/internal.h
> index 952a2f483f94..c6a3351a4d7d 100644
> --- a/fs/erofs/internal.h
> +++ b/fs/erofs/internal.h
> @@ -97,6 +97,10 @@ struct erofs_sb_lz4_info {
>  	u16 max_pclusterblks;
>  };
>  
> +struct erofs_fscache {
> +	struct fscache_cookie *cookie;
> +};
> +
>  struct erofs_sb_info {
>  	struct erofs_mount_opts opt;	/* options */
>  #ifdef CONFIG_EROFS_FS_ZIP
> @@ -626,9 +630,24 @@ static inline int z_erofs_load_lzma_config(struct super_block *sb,
>  #ifdef CONFIG_EROFS_FS_ONDEMAND
>  int erofs_fscache_register_fs(struct super_block *sb);
>  void erofs_fscache_unregister_fs(struct super_block *sb);
> +
> +int erofs_fscache_register_cookie(struct super_block *sb,
> +				  struct erofs_fscache **fscache, char *name);
> +void erofs_fscache_unregister_cookie(struct erofs_fscache **fscache);
>  #else
>  static inline int erofs_fscache_register_fs(struct super_block *sb) { return 0; }
>  static inline void erofs_fscache_unregister_fs(struct super_block *sb) {}
> +
> +static inline int erofs_fscache_register_cookie(struct super_block *sb,
> +						struct erofs_fscache **fscache,
> +						char *name)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static inline void erofs_fscache_unregister_cookie(struct erofs_fscache **fscache)
> +{
> +}
>  #endif
>  
>  #define EFSCORRUPTED    EUCLEAN         /* Filesystem is corrupted */
> -- 
> 2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

