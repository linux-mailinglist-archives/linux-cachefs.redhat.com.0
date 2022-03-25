Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DDE4E7484
	for <lists+linux-cachefs@lfdr.de>; Fri, 25 Mar 2022 14:52:02 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-283-PuZUjcICMke1At2nFyZ9qQ-1; Fri, 25 Mar 2022 09:51:58 -0400
X-MC-Unique: PuZUjcICMke1At2nFyZ9qQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A953E899EC1;
	Fri, 25 Mar 2022 13:51:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 65085403D17D;
	Fri, 25 Mar 2022 13:51:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 91E551940352;
	Fri, 25 Mar 2022 13:51:55 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 872951940341 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 25 Mar 2022 13:51:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D40B340146E; Fri, 25 Mar 2022 13:51:50 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D0242401E91
 for <linux-cachefs@redhat.com>; Fri, 25 Mar 2022 13:51:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B7C7F18A6582
 for <linux-cachefs@redhat.com>; Fri, 25 Mar 2022 13:51:50 +0000 (UTC)
Received: from out199-8.us.a.mail.aliyun.com (out199-8.us.a.mail.aliyun.com
 [47.90.199.8]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-576-Y749eZ-SNcGJG5FIgejOYg-1; Fri, 25 Mar 2022 09:51:48 -0400
X-MC-Unique: Y749eZ-SNcGJG5FIgejOYg-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R501e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04426; MF=hsiangkao@linux.alibaba.com;
 NM=1; PH=DS; RN=19; SR=0; TI=SMTPD_---0V8A2H-n_1648215995
Received: from B-P7TQMD6M-0146.local(mailfrom:hsiangkao@linux.alibaba.com
 fp:SMTPD_---0V8A2H-n_1648215995) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 25 Mar 2022 21:46:37 +0800
Date: Fri, 25 Mar 2022 21:46:35 +0800
From: Gao Xiang <hsiangkao@linux.alibaba.com>
To: Jeffle Xu <jefflexu@linux.alibaba.com>
Message-ID: <Yj3HuzncvkkwWBvD@B-P7TQMD6M-0146.local>
Mail-Followup-To: Jeffle Xu <jefflexu@linux.alibaba.com>,
 dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
 chao@kernel.org, linux-erofs@lists.ozlabs.org,
 gregkh@linuxfoundation.org, fannaihao@baidu.com,
 tao.peng@linux.alibaba.com, willy@infradead.org,
 linux-kernel@vger.kernel.org, tianzichen@kuaishou.com,
 joseph.qi@linux.alibaba.com, bo.liu@linux.alibaba.com,
 linux-fsdevel@vger.kernel.org, luodaowen.backend@bytedance.com,
 eguan@linux.alibaba.com, gerry@linux.alibaba.com,
 torvalds@linux-foundation.org
References: <20220325122223.102958-1-jefflexu@linux.alibaba.com>
 <20220325122223.102958-14-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <20220325122223.102958-14-jefflexu@linux.alibaba.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: Re: [Linux-cachefs] [PATCH v6 13/22] erofs: add anonymous inode
 managing page cache of blob file
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
Cc: tianzichen@kuaishou.com, gregkh@linuxfoundation.org, chao@kernel.org,
 fannaihao@baidu.com, tao.peng@linux.alibaba.com, willy@infradead.org,
 linux-kernel@vger.kernel.org, joseph.qi@linux.alibaba.com,
 linux-cachefs@redhat.com, bo.liu@linux.alibaba.com,
 torvalds@linux-foundation.org, linux-fsdevel@vger.kernel.org,
 luodaowen.backend@bytedance.com, xiang@kernel.org, gerry@linux.alibaba.com,
 linux-erofs@lists.ozlabs.org, eguan@linux.alibaba.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Mar 25, 2022 at 08:22:14PM +0800, Jeffle Xu wrote:
> Introduce one anonymous inode for managing page cache of corresponding
> blob file. Then erofs could read directly from the address space of the
> anonymous inode when cache hit.
> 
> Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
> ---
>  fs/erofs/fscache.c  | 41 ++++++++++++++++++++++++++++++++++++++++-
>  fs/erofs/internal.h |  7 +++++--
>  2 files changed, 45 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/erofs/fscache.c b/fs/erofs/fscache.c
> index 73235fd43bf6..30383d9adb62 100644
> --- a/fs/erofs/fscache.c
> +++ b/fs/erofs/fscache.c
> @@ -7,6 +7,9 @@
>  
>  static struct fscache_volume *volume;
>  
> +static const struct address_space_operations erofs_fscache_blob_aops = {
> +};
> +
>  static int erofs_fscache_init_cookie(struct erofs_fscache *ctx, char *path)
>  {
>  	struct fscache_cookie *cookie;
> @@ -31,6 +34,29 @@ static inline void erofs_fscache_cleanup_cookie(struct erofs_fscache *ctx)
>  	ctx->cookie = NULL;
>  }
>  
> +static int erofs_fscache_get_inode(struct erofs_fscache *ctx,
> +				   struct super_block *sb)

I think it can be folded as well.

> +{
> +	struct inode *const inode = new_inode(sb);
> +
> +	if (!inode)
> +		return -ENOMEM;
> +
> +	set_nlink(inode, 1);
> +	inode->i_size = OFFSET_MAX;
> +	inode->i_mapping->a_ops = &erofs_fscache_blob_aops;
> +	mapping_set_gfp_mask(inode->i_mapping, GFP_NOFS);
> +
> +	ctx->inode = inode;
> +	return 0;
> +}
> +
> +static inline void erofs_fscache_put_inode(struct erofs_fscache *ctx)

Ditto.

> +{
> +	iput(ctx->inode);
> +	ctx->inode = NULL;
> +}
> +
>  /*
>   * erofs_fscache_get - create an fscache context for blob file
>   * @sb:		superblock
> @@ -38,7 +64,8 @@ static inline void erofs_fscache_cleanup_cookie(struct erofs_fscache *ctx)
>   *
>   * Return: fscache context on success, ERR_PTR() on failure.
>   */
> -struct erofs_fscache *erofs_fscache_get(struct super_block *sb, char *path)
> +struct erofs_fscache *erofs_fscache_get(struct super_block *sb, char *path,
> +					bool need_inode)
>  {
>  	struct erofs_fscache *ctx;
>  	int ret;
> @@ -53,7 +80,18 @@ struct erofs_fscache *erofs_fscache_get(struct super_block *sb, char *path)
>  		goto err;
>  	}
>  
> +	if (need_inode) {
> +		ret = erofs_fscache_get_inode(ctx, sb);
> +		if (ret) {
> +			erofs_err(sb, "failed to get anonymous inode");

				       failed to get fscache inode of [path].

Thanks,
Gao Xiang

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

