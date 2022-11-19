Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9A5630824
	for <lists+linux-cachefs@lfdr.de>; Sat, 19 Nov 2022 01:48:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668818919;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GALGbaWZm4DnYmHMRjDH806FMMloECnQltdJy7hoyDU=;
	b=ShK13iQ/RXbe+u0mnCGlsZTHHE752BBrfBzvalIrBlalZXJW7t+bGDgpJg+QFFGqi00M3+
	Cop8+7vdZdgFBKylQPd4skyXaDz/QHYuQ6ef5mOE7bEzhFLz3ZBkqFl7rbM5eeuZ4BMPC3
	XxRpzDhqoktjxD79bx32ou8vyJd4na0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-513-6zW-bl5FPcunmGqs-9KWBg-1; Fri, 18 Nov 2022 19:48:36 -0500
X-MC-Unique: 6zW-bl5FPcunmGqs-9KWBg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 70DD0380673F;
	Sat, 19 Nov 2022 00:48:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 041A74C819;
	Sat, 19 Nov 2022 00:48:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DBE7D19465B7;
	Sat, 19 Nov 2022 00:48:32 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 237D91946587 for <linux-cachefs@listman.corp.redhat.com>;
 Sat, 19 Nov 2022 00:48:32 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E29044B3FCE; Sat, 19 Nov 2022 00:48:31 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DB1304B3FCD
 for <linux-cachefs@redhat.com>; Sat, 19 Nov 2022 00:48:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB753185A792
 for <linux-cachefs@redhat.com>; Sat, 19 Nov 2022 00:48:31 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636-5HmbuxWfPd60RuewOSH6cA-1; Fri, 18 Nov 2022 19:48:30 -0500
X-MC-Unique: 5HmbuxWfPd60RuewOSH6cA-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A7879627F0;
 Sat, 19 Nov 2022 00:42:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECE6FC433D6;
 Sat, 19 Nov 2022 00:42:04 +0000 (UTC)
Date: Sat, 19 Nov 2022 08:42:01 +0800
From: Gao Xiang <xiang@kernel.org>
To: Jingbo Xu <jefflexu@linux.alibaba.com>
Message-ID: <Y3gmWeqHBHjQEfHr@debian>
Mail-Followup-To: Jingbo Xu <jefflexu@linux.alibaba.com>, xiang@kernel.org,
 chao@kernel.org, jlayton@kernel.org, linux-erofs@lists.ozlabs.org,
 linux-cachefs@redhat.com, dhowells@redhat.com,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
References: <20221117053017.21074-1-jefflexu@linux.alibaba.com>
 <20221117053017.21074-3-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <20221117053017.21074-3-jefflexu@linux.alibaba.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: [Linux-cachefs] [PATCH v4 2/2] erofs: switch to
 prepare_ondemand_read() in fscache mode
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
Cc: chao@kernel.org, jlayton@kernel.org, linux-kernel@vger.kernel.org,
 linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org, xiang@kernel.org,
 linux-erofs@lists.ozlabs.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 17, 2022 at 01:30:17PM +0800, Jingbo Xu wrote:
> Switch to prepare_ondemand_read() interface and a self-contained request
> completion to get rid of netfs_io_[request|subrequest].
> 
> The whole request will still be split into slices (subrequest) according
> to the cache state of the backing file.  As long as one of the
> subrequests fails, the whole request will be marked as failed.
> 
> Signed-off-by: Jingbo Xu <jefflexu@linux.alibaba.com>

Reviewed-by: Gao Xiang <hsiangkao@linux.alibaba.com>

Thanks,
Gao Xiang

> ---
>  fs/erofs/fscache.c | 260 ++++++++++++++++-----------------------------
>  1 file changed, 93 insertions(+), 167 deletions(-)
> 
> diff --git a/fs/erofs/fscache.c b/fs/erofs/fscache.c
> index af5ed6b9c54d..52502bbaa994 100644
> --- a/fs/erofs/fscache.c
> +++ b/fs/erofs/fscache.c
> @@ -11,257 +11,179 @@ static DEFINE_MUTEX(erofs_domain_cookies_lock);
>  static LIST_HEAD(erofs_domain_list);
>  static struct vfsmount *erofs_pseudo_mnt;
>  
> -static struct netfs_io_request *erofs_fscache_alloc_request(struct address_space *mapping,
> +struct erofs_fscache_request {
> +	struct netfs_cache_resources cache_resources;
> +	struct address_space	*mapping;	/* The mapping being accessed */
> +	loff_t			start;		/* Start position */
> +	size_t			len;		/* Length of the request */
> +	size_t			submitted;	/* Length of submitted */
> +	short			error;		/* 0 or error that occurred */
> +	refcount_t		ref;
> +};
> +
> +static struct erofs_fscache_request *erofs_fscache_req_alloc(struct address_space *mapping,
>  					     loff_t start, size_t len)
>  {
> -	struct netfs_io_request *rreq;
> +	struct erofs_fscache_request *req;
>  
> -	rreq = kzalloc(sizeof(struct netfs_io_request), GFP_KERNEL);
> -	if (!rreq)
> +	req = kzalloc(sizeof(struct erofs_fscache_request), GFP_KERNEL);
> +	if (!req)
>  		return ERR_PTR(-ENOMEM);
>  
> -	rreq->start	= start;
> -	rreq->len	= len;
> -	rreq->mapping	= mapping;
> -	rreq->inode	= mapping->host;
> -	INIT_LIST_HEAD(&rreq->subrequests);
> -	refcount_set(&rreq->ref, 1);
> -	return rreq;
> -}
> -
> -static void erofs_fscache_put_request(struct netfs_io_request *rreq)
> -{
> -	if (!refcount_dec_and_test(&rreq->ref))
> -		return;
> -	if (rreq->cache_resources.ops)
> -		rreq->cache_resources.ops->end_operation(&rreq->cache_resources);
> -	kfree(rreq);
> -}
> -
> -static void erofs_fscache_put_subrequest(struct netfs_io_subrequest *subreq)
> -{
> -	if (!refcount_dec_and_test(&subreq->ref))
> -		return;
> -	erofs_fscache_put_request(subreq->rreq);
> -	kfree(subreq);
> -}
> +	req->mapping = mapping;
> +	req->start   = start;
> +	req->len     = len;
> +	refcount_set(&req->ref, 1);
>  
> -static void erofs_fscache_clear_subrequests(struct netfs_io_request *rreq)
> -{
> -	struct netfs_io_subrequest *subreq;
> -
> -	while (!list_empty(&rreq->subrequests)) {
> -		subreq = list_first_entry(&rreq->subrequests,
> -				struct netfs_io_subrequest, rreq_link);
> -		list_del(&subreq->rreq_link);
> -		erofs_fscache_put_subrequest(subreq);
> -	}
> +	return req;
>  }
>  
> -static void erofs_fscache_rreq_unlock_folios(struct netfs_io_request *rreq)
> +static void erofs_fscache_req_complete(struct erofs_fscache_request *req)
>  {
> -	struct netfs_io_subrequest *subreq;
>  	struct folio *folio;
> -	unsigned int iopos = 0;
> -	pgoff_t start_page = rreq->start / PAGE_SIZE;
> -	pgoff_t last_page = ((rreq->start + rreq->len) / PAGE_SIZE) - 1;
> -	bool subreq_failed = false;
> +	bool failed = req->error;
> +	pgoff_t start_page = req->start / PAGE_SIZE;
> +	pgoff_t last_page = ((req->start + req->len) / PAGE_SIZE) - 1;
>  
> -	XA_STATE(xas, &rreq->mapping->i_pages, start_page);
> -
> -	subreq = list_first_entry(&rreq->subrequests,
> -				  struct netfs_io_subrequest, rreq_link);
> -	subreq_failed = (subreq->error < 0);
> +	XA_STATE(xas, &req->mapping->i_pages, start_page);
>  
>  	rcu_read_lock();
>  	xas_for_each(&xas, folio, last_page) {
> -		unsigned int pgpos, pgend;
> -		bool pg_failed = false;
> -
>  		if (xas_retry(&xas, folio))
>  			continue;
> -
> -		pgpos = (folio_index(folio) - start_page) * PAGE_SIZE;
> -		pgend = pgpos + folio_size(folio);
> -
> -		for (;;) {
> -			if (!subreq) {
> -				pg_failed = true;
> -				break;
> -			}
> -
> -			pg_failed |= subreq_failed;
> -			if (pgend < iopos + subreq->len)
> -				break;
> -
> -			iopos += subreq->len;
> -			if (!list_is_last(&subreq->rreq_link,
> -					  &rreq->subrequests)) {
> -				subreq = list_next_entry(subreq, rreq_link);
> -				subreq_failed = (subreq->error < 0);
> -			} else {
> -				subreq = NULL;
> -				subreq_failed = false;
> -			}
> -			if (pgend == iopos)
> -				break;
> -		}
> -
> -		if (!pg_failed)
> +		if (!failed)
>  			folio_mark_uptodate(folio);
> -
>  		folio_unlock(folio);
>  	}
>  	rcu_read_unlock();
> +
> +	if (req->cache_resources.ops)
> +		req->cache_resources.ops->end_operation(&req->cache_resources);
> +
> +	kfree(req);
>  }
>  
> -static void erofs_fscache_rreq_complete(struct netfs_io_request *rreq)
> +static void erofs_fscache_req_put(struct erofs_fscache_request *req)
>  {
> -	erofs_fscache_rreq_unlock_folios(rreq);
> -	erofs_fscache_clear_subrequests(rreq);
> -	erofs_fscache_put_request(rreq);
> +	if (refcount_dec_and_test(&req->ref))
> +		erofs_fscache_req_complete(req);
>  }
>  
> -static void erofc_fscache_subreq_complete(void *priv,
> +static void erofs_fscache_subreq_complete(void *priv,
>  		ssize_t transferred_or_error, bool was_async)
>  {
> -	struct netfs_io_subrequest *subreq = priv;
> -	struct netfs_io_request *rreq = subreq->rreq;
> +	struct erofs_fscache_request *req = priv;
>  
>  	if (IS_ERR_VALUE(transferred_or_error))
> -		subreq->error = transferred_or_error;
> -
> -	if (atomic_dec_and_test(&rreq->nr_outstanding))
> -		erofs_fscache_rreq_complete(rreq);
> -
> -	erofs_fscache_put_subrequest(subreq);
> +		req->error = transferred_or_error;
> +	erofs_fscache_req_put(req);
>  }
>  
>  /*
> - * Read data from fscache and fill the read data into page cache described by
> - * @rreq, which shall be both aligned with PAGE_SIZE. @pstart describes
> - * the start physical address in the cache file.
> + * Read data from fscache (cookie, pstart, len), and fill the read data into
> + * page cache described by (req->mapping, lstart, len). @pstart describeis the
> + * start physical address in the cache file.
>   */
>  static int erofs_fscache_read_folios_async(struct fscache_cookie *cookie,
> -				struct netfs_io_request *rreq, loff_t pstart)
> +		struct erofs_fscache_request *req, loff_t pstart, size_t len)
>  {
>  	enum netfs_io_source source;
> -	struct super_block *sb = rreq->mapping->host->i_sb;
> -	struct netfs_io_subrequest *subreq;
> -	struct netfs_cache_resources *cres = &rreq->cache_resources;
> +	struct super_block *sb = req->mapping->host->i_sb;
> +	struct netfs_cache_resources *cres = &req->cache_resources;
>  	struct iov_iter iter;
> -	loff_t start = rreq->start;
> -	size_t len = rreq->len;
> +	loff_t lstart = req->start + req->submitted;
>  	size_t done = 0;
>  	int ret;
>  
> -	atomic_set(&rreq->nr_outstanding, 1);
> +	DBG_BUGON(len > req->len - req->submitted);
>  
>  	ret = fscache_begin_read_operation(cres, cookie);
>  	if (ret)
> -		goto out;
> +		return ret;
>  
>  	while (done < len) {
> -		subreq = kzalloc(sizeof(struct netfs_io_subrequest),
> -				 GFP_KERNEL);
> -		if (subreq) {
> -			INIT_LIST_HEAD(&subreq->rreq_link);
> -			refcount_set(&subreq->ref, 2);
> -			subreq->rreq = rreq;
> -			refcount_inc(&rreq->ref);
> -		} else {
> -			ret = -ENOMEM;
> -			goto out;
> -		}
> -
> -		subreq->start = pstart + done;
> -		subreq->len	=  len - done;
> -		subreq->flags = 1 << NETFS_SREQ_ONDEMAND;
> +		loff_t sstart = pstart + done;
> +		size_t slen = len - done;
> +		unsigned long flags = 1 << NETFS_SREQ_ONDEMAND;
>  
> -		list_add_tail(&subreq->rreq_link, &rreq->subrequests);
> -
> -		source = cres->ops->prepare_read(subreq, LLONG_MAX);
> -		if (WARN_ON(subreq->len == 0))
> +		source = cres->ops->prepare_ondemand_read(cres, sstart, &slen, LLONG_MAX, &flags);
> +		if (WARN_ON(slen == 0))
>  			source = NETFS_INVALID_READ;
>  		if (source != NETFS_READ_FROM_CACHE) {
> -			erofs_err(sb, "failed to fscache prepare_read (source %d)",
> -				  source);
> -			ret = -EIO;
> -			subreq->error = ret;
> -			erofs_fscache_put_subrequest(subreq);
> -			goto out;
> +			erofs_err(sb, "failed to fscache prepare_read (source %d)", source);
> +			return -EIO;
>  		}
>  
> -		atomic_inc(&rreq->nr_outstanding);
> +		refcount_inc(&req->ref);
> +		iov_iter_xarray(&iter, READ, &req->mapping->i_pages,
> +				lstart + done, slen);
>  
> -		iov_iter_xarray(&iter, READ, &rreq->mapping->i_pages,
> -				start + done, subreq->len);
> -
> -		ret = fscache_read(cres, subreq->start, &iter,
> -				   NETFS_READ_HOLE_FAIL,
> -				   erofc_fscache_subreq_complete, subreq);
> +		ret = fscache_read(cres, sstart, &iter, NETFS_READ_HOLE_FAIL,
> +				   erofs_fscache_subreq_complete, req);
>  		if (ret == -EIOCBQUEUED)
>  			ret = 0;
>  		if (ret) {
>  			erofs_err(sb, "failed to fscache_read (ret %d)", ret);
> -			goto out;
> +			return ret;
>  		}
>  
> -		done += subreq->len;
> +		done += slen;
>  	}
> -out:
> -	if (atomic_dec_and_test(&rreq->nr_outstanding))
> -		erofs_fscache_rreq_complete(rreq);
> -
> -	return ret;
> +	DBG_BUGON(done != len);
> +	req->submitted += len;
> +	return 0;
>  }
>  
>  static int erofs_fscache_meta_read_folio(struct file *data, struct folio *folio)
>  {
>  	int ret;
>  	struct super_block *sb = folio_mapping(folio)->host->i_sb;
> -	struct netfs_io_request *rreq;
> +	struct erofs_fscache_request *req;
>  	struct erofs_map_dev mdev = {
>  		.m_deviceid = 0,
>  		.m_pa = folio_pos(folio),
>  	};
>  
>  	ret = erofs_map_dev(sb, &mdev);
> -	if (ret)
> -		goto out;
> +	if (ret) {
> +		folio_unlock(folio);
> +		return ret;
> +	}
>  
> -	rreq = erofs_fscache_alloc_request(folio_mapping(folio),
> +	req = erofs_fscache_req_alloc(folio_mapping(folio),
>  				folio_pos(folio), folio_size(folio));
> -	if (IS_ERR(rreq)) {
> -		ret = PTR_ERR(rreq);
> -		goto out;
> +	if (IS_ERR(req)) {
> +		folio_unlock(folio);
> +		return PTR_ERR(req);
>  	}
>  
> -	return erofs_fscache_read_folios_async(mdev.m_fscache->cookie,
> -				rreq, mdev.m_pa);
> -out:
> -	folio_unlock(folio);
> +	ret = erofs_fscache_read_folios_async(mdev.m_fscache->cookie,
> +				req, mdev.m_pa, folio_size(folio));
> +	if (ret)
> +		req->error = ret;
> +
> +	erofs_fscache_req_put(req);
>  	return ret;
>  }
>  
>  /*
>   * Read into page cache in the range described by (@pos, @len).
>   *
> - * On return, the caller is responsible for page unlocking if the output @unlock
> - * is true, or the callee will take this responsibility through netfs_io_request
> - * interface.
> + * On return, if the output @unlock is true, the caller is responsible for page
> + * unlocking; otherwise the callee will take this responsibility through request
> + * completion.
>   *
>   * The return value is the number of bytes successfully handled, or negative
>   * error code on failure. The only exception is that, the length of the range
> - * instead of the error code is returned on failure after netfs_io_request is
> - * allocated, so that .readahead() could advance rac accordingly.
> + * instead of the error code is returned on failure after request is allocated,
> + * so that .readahead() could advance rac accordingly.
>   */
>  static int erofs_fscache_data_read(struct address_space *mapping,
>  				   loff_t pos, size_t len, bool *unlock)
>  {
>  	struct inode *inode = mapping->host;
>  	struct super_block *sb = inode->i_sb;
> -	struct netfs_io_request *rreq;
> +	struct erofs_fscache_request *req;
>  	struct erofs_map_blocks map;
>  	struct erofs_map_dev mdev;
>  	struct iov_iter iter;
> @@ -318,13 +240,17 @@ static int erofs_fscache_data_read(struct address_space *mapping,
>  	if (ret)
>  		return ret;
>  
> -	rreq = erofs_fscache_alloc_request(mapping, pos, count);
> -	if (IS_ERR(rreq))
> -		return PTR_ERR(rreq);
> +	req = erofs_fscache_req_alloc(mapping, pos, count);
> +	if (IS_ERR(req))
> +		return PTR_ERR(req);
>  
>  	*unlock = false;
> -	erofs_fscache_read_folios_async(mdev.m_fscache->cookie,
> -			rreq, mdev.m_pa + (pos - map.m_la));
> +	ret = erofs_fscache_read_folios_async(mdev.m_fscache->cookie,
> +			req, mdev.m_pa + (pos - map.m_la), count);
> +	if (ret)
> +		req->error = ret;
> +
> +	erofs_fscache_req_put(req);
>  	return count;
>  }
>  
> -- 
> 2.19.1.6.gb485710b
> 

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

