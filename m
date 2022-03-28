Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 905DF4E8C55
	for <lists+linux-cachefs@lfdr.de>; Mon, 28 Mar 2022 04:50:00 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-209-4pH4hZTtPCa7Al5hiJtNlA-1; Sun, 27 Mar 2022 22:49:56 -0400
X-MC-Unique: 4pH4hZTtPCa7Al5hiJtNlA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BF4691010366;
	Mon, 28 Mar 2022 02:49:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2306140D1B9B;
	Mon, 28 Mar 2022 02:49:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 175CB1947BBC;
	Mon, 28 Mar 2022 02:49:53 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B5EE119451F1 for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 28 Mar 2022 02:49:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A44F9401E86; Mon, 28 Mar 2022 02:49:51 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A0D57401474
 for <linux-cachefs@redhat.com>; Mon, 28 Mar 2022 02:49:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 86592801585
 for <linux-cachefs@redhat.com>; Mon, 28 Mar 2022 02:49:51 +0000 (UTC)
Received: from out30-57.freemail.mail.aliyun.com
 (out30-57.freemail.mail.aliyun.com [115.124.30.57]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-h3xgTdQrOLGXi42lYpGADA-1; Sun, 27 Mar 2022 22:49:47 -0400
X-MC-Unique: h3xgTdQrOLGXi42lYpGADA-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R271e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04357; MF=hsiangkao@linux.alibaba.com;
 NM=1; PH=DS; RN=19; SR=0; TI=SMTPD_---0V8KSgjt_1648435779
Received: from B-P7TQMD6M-0146.local(mailfrom:hsiangkao@linux.alibaba.com
 fp:SMTPD_---0V8KSgjt_1648435779) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 28 Mar 2022 10:49:42 +0800
Date: Mon, 28 Mar 2022 10:49:39 +0800
From: Gao Xiang <hsiangkao@linux.alibaba.com>
To: Jeffle Xu <jefflexu@linux.alibaba.com>
Message-ID: <YkEiQywvozBKTExr@B-P7TQMD6M-0146.local>
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
 <20220325122223.102958-15-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <20220325122223.102958-15-jefflexu@linux.alibaba.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: Re: [Linux-cachefs] [PATCH v6 14/22] erofs: add
 erofs_fscache_read_folios() helper
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

On Fri, Mar 25, 2022 at 08:22:15PM +0800, Jeffle Xu wrote:
> Add erofs_fscache_read_folios() helper reading from fscache. It supports
> on-demand read semantics. That is, it will make the backend prepare for
> the data when cache miss. Once data ready, it will reinitiate a read
> from the cache.
> 
> This helper can then be used to implement .readpage()/.readahead() of
> on-demand read semantics.
> 
> Besides also add erofs_fscache_read_folio() wrapper helper.
> 
> Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
> ---
>  fs/erofs/fscache.c | 39 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/fs/erofs/fscache.c b/fs/erofs/fscache.c
> index 30383d9adb62..6a55f7b5f883 100644
> --- a/fs/erofs/fscache.c
> +++ b/fs/erofs/fscache.c
> @@ -7,6 +7,45 @@
>  
>  static struct fscache_volume *volume;
>  
> +/*
> + * erofs_fscache_read_folios - Read data from fscache.
> + *
> + * Fill the read data into page cache described by @start/len, which shall be
> + * both aligned with PAGE_SIZE. @pstart describes the corresponding physical
> + * start address in the cache file.
> + */
> +static int erofs_fscache_read_folios(struct fscache_cookie *cookie,
> +				     struct address_space *mapping,
> +				     loff_t start, size_t len,
> +				     loff_t pstart)
> +{
> +	struct netfs_cache_resources cres;
> +	struct iov_iter iter;
> +	int ret;
> +
> +	memset(&cres, 0, sizeof(cres));
> +
> +	ret = fscache_begin_read_operation(&cres, cookie);
> +	if (ret)
> +		return ret;
> +
> +	iov_iter_xarray(&iter, READ, &mapping->i_pages, start, len);
> +
> +	ret = fscache_read(&cres, pstart, &iter,
> +			   NETFS_READ_HOLE_ONDEMAND, NULL, NULL);
> +
> +	fscache_end_operation(&cres);
> +	return ret;
> +}
> +
> +static inline int erofs_fscache_read_folio(struct fscache_cookie *cookie,
> +					   struct folio *folio, loff_t pstart)

I've seen two users of this helper,

 1) erofs_fscache_readpage_noinline
 2) erofs_fscache_readpage_blob

Actually, we could fold such logic in these users since this additional
helper doesn't enhance the readability but increase the overhead when
reading the code.

It'd be better to get rid of it instead.

Thanks,
Gao Xiang

> +{
> +	return erofs_fscache_read_folios(cookie, folio_file_mapping(folio),
> +					 folio_pos(folio), folio_size(folio),
> +					 pstart);
> +}
> +
>  static const struct address_space_operations erofs_fscache_blob_aops = {
>  };
>  
> -- 
> 2.27.0
> 
> --
> Linux-cachefs mailing list
> Linux-cachefs@redhat.com
> https://listman.redhat.com/mailman/listinfo/linux-cachefs

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

