Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 735224E745B
	for <lists+linux-cachefs@lfdr.de>; Fri, 25 Mar 2022 14:42:04 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-29-ZGFHuzqCPEWhxNUc6i5p4A-1; Fri, 25 Mar 2022 09:42:00 -0400
X-MC-Unique: ZGFHuzqCPEWhxNUc6i5p4A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 91A701C05151;
	Fri, 25 Mar 2022 13:41:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BAD382024CB9;
	Fri, 25 Mar 2022 13:41:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9AC491940352;
	Fri, 25 Mar 2022 13:41:56 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8BA771940341 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 25 Mar 2022 13:41:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 68A60400E577; Fri, 25 Mar 2022 13:41:54 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 647F140CFD10
 for <linux-cachefs@redhat.com>; Fri, 25 Mar 2022 13:41:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B02A954700
 for <linux-cachefs@redhat.com>; Fri, 25 Mar 2022 13:41:54 +0000 (UTC)
Received: from out30-133.freemail.mail.aliyun.com
 (out30-133.freemail.mail.aliyun.com [115.124.30.133]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-173-__97RQCkMLqL_55cIERy7g-1; Fri, 25 Mar 2022 09:41:49 -0400
X-MC-Unique: __97RQCkMLqL_55cIERy7g-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R151e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04426; MF=hsiangkao@linux.alibaba.com;
 NM=1; PH=DS; RN=19; SR=0; TI=SMTPD_---0V89jU5E_1648215702
Received: from B-P7TQMD6M-0146.local(mailfrom:hsiangkao@linux.alibaba.com
 fp:SMTPD_---0V89jU5E_1648215702) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 25 Mar 2022 21:41:44 +0800
Date: Fri, 25 Mar 2022 21:41:42 +0800
From: Gao Xiang <hsiangkao@linux.alibaba.com>
To: Jeffle Xu <jefflexu@linux.alibaba.com>
Message-ID: <Yj3GlpvjL3u0RTjN@B-P7TQMD6M-0146.local>
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
References: <20220325122223.102958-1-jefflexu@linux.alibaba.com>
 <20220325122223.102958-13-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <20220325122223.102958-13-jefflexu@linux.alibaba.com>
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
Subject: Re: [Linux-cachefs] [PATCH v6 12/22] erofs: add cookie context
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Jeffle,

On Fri, Mar 25, 2022 at 08:22:13PM +0800, Jeffle Xu wrote:
> Introduce "struct erofs_fscache" for managing cookie for backinig file,
> and helper functions for initializing and cleaning up this context
> structure.
> 
> Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
> ---
>  fs/erofs/fscache.c  | 61 +++++++++++++++++++++++++++++++++++++++++++++
>  fs/erofs/internal.h | 14 +++++++++++
>  2 files changed, 75 insertions(+)
> 
> diff --git a/fs/erofs/fscache.c b/fs/erofs/fscache.c
> index 08cf570a0810..73235fd43bf6 100644
> --- a/fs/erofs/fscache.c
> +++ b/fs/erofs/fscache.c
> @@ -7,6 +7,67 @@
>  
>  static struct fscache_volume *volume;
>  
> +static int erofs_fscache_init_cookie(struct erofs_fscache *ctx, char *path)
> +{
> +	struct fscache_cookie *cookie;
> +
> +	cookie = fscache_acquire_cookie(volume, FSCACHE_ADV_WANT_CACHE_SIZE,
> +					path, strlen(path),
> +					NULL, 0, 0);

It'd be better to rearrange in one line?

					path, strlen(path), NULL, 0, 0);

> +	if (!cookie)
> +		return -EINVAL;
> +
> +	fscache_use_cookie(cookie, false);
> +	ctx->cookie = cookie;
> +	return 0;
> +}
> +
> +static inline void erofs_fscache_cleanup_cookie(struct erofs_fscache *ctx)
> +{
> +	struct fscache_cookie *cookie = ctx->cookie;
> +
> +	fscache_unuse_cookie(cookie, NULL, NULL);
> +	fscache_relinquish_cookie(cookie, false);
> +	ctx->cookie = NULL;
> +}
> +
> +/*
> + * erofs_fscache_get - create an fscache context for blob file
> + * @sb:		superblock
> + * @path:	name of blob file
> + *
> + * Return: fscache context on success, ERR_PTR() on failure.
> + */
> +struct erofs_fscache *erofs_fscache_get(struct super_block *sb, char *path)

erofs_fscache_register?

> +{
> +	struct erofs_fscache *ctx;
> +	int ret;
> +
> +	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return ERR_PTR(-ENOMEM);
> +
> +	ret = erofs_fscache_init_cookie(ctx, path);

Can we fold it here? No need to introduce such simple wrapper..

> +	if (ret) {
> +		erofs_err(sb, "failed to init cookie");

It would be better to print the path?

> +		goto err;

		kfree(ctx);
		return ERR_PTR(ret);

At least for now.

> +	}
> +
> +	return ctx;
> +err:
> +	kfree(ctx);
> +	return ERR_PTR(ret);
> +}
> +
> +void erofs_fscache_put(struct erofs_fscache *ctx)

erofs_fscache_unregister?

> +{
> +	if (!ctx)
> +		return;
> +
> +	erofs_fscache_cleanup_cookie(ctx);

Fold it too, since such helper doesn't simplify code a lot but need
to take one more time to redirect..

Thanks,
Gao Xiang

> +	kfree(ctx);
> +}
> +
>  int __init erofs_init_fscache(void)
>  {
>  	volume = fscache_acquire_volume("erofs", NULL, NULL, 0);
> diff --git a/fs/erofs/internal.h b/fs/erofs/internal.h
> index 45b8b0dd8a27..d4f2b43cedae 100644
> --- a/fs/erofs/internal.h
> +++ b/fs/erofs/internal.h
> @@ -96,6 +96,10 @@ struct erofs_sb_lz4_info {
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
> @@ -620,9 +624,19 @@ static inline int z_erofs_load_lzma_config(struct super_block *sb,
>  #ifdef CONFIG_EROFS_FS_ONDEMAND
>  int erofs_init_fscache(void);
>  void erofs_exit_fscache(void);
> +
> +struct erofs_fscache *erofs_fscache_get(struct super_block *sb, char *path);
> +void erofs_fscache_put(struct erofs_fscache *ctx);
>  #else
>  static inline int erofs_init_fscache(void) { return 0; }
>  static inline void erofs_exit_fscache(void) {}
> +
> +static inline struct erofs_fscache *erofs_fscache_get(struct super_block *sb,
> +						      char *path)
> +{
> +	return ERR_PTR(-EOPNOTSUPP);
> +}
> +static inline void erofs_fscache_put(struct erofs_fscache *ctx) {}
>  #endif
>  
>  #define EFSCORRUPTED    EUCLEAN         /* Filesystem is corrupted */
> -- 
> 2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

