Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 02B2231F492
	for <lists+linux-cachefs@lfdr.de>; Fri, 19 Feb 2021 06:09:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1613711363;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=yjj/uvZlGHYMZ05nFLKpQ4DCUGzUEt793QKfmOYiIEk=;
	b=K3G9S3AeEFjz0L/nXeCS61suMwrjBoIVWVrgAswA6Rq0PrHzFJMZ5kYwM1Z4Y7sCBfFAxZ
	/M5IAfEim1VPSIOalKiGhNGw0GHRYpg4JtKjHyjjUtKw/xTJMnwuHf7PxsljdehjqmKRy7
	RMXIjSl5Fc4H2wdFD+AUHELOmePxxj8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-jKPSJzWgNdqQJUmFE0lnmg-1; Fri, 19 Feb 2021 00:09:21 -0500
X-MC-Unique: jKPSJzWgNdqQJUmFE0lnmg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 854B5107ACC7;
	Fri, 19 Feb 2021 05:09:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B9E7B2D035;
	Fri, 19 Feb 2021 05:09:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1236C18095CB;
	Fri, 19 Feb 2021 05:09:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11J59B6c030356 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 19 Feb 2021 00:09:11 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0A39861D2D; Fri, 19 Feb 2021 05:09:11 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from [10.72.12.190] (ovpn-12-190.pek2.redhat.com [10.72.12.190])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E3092D035;
	Fri, 19 Feb 2021 05:09:04 +0000 (UTC)
To: Jeff Layton <jlayton@kernel.org>, dhowells@redhat.com, idryomov@gmail.com
References: <20210217125845.10319-1-jlayton@kernel.org>
	<20210217125845.10319-2-jlayton@kernel.org>
From: Xiubo Li <xiubli@redhat.com>
Message-ID: <d6fcd45c-21eb-d00e-db8a-f2e9441d7f85@redhat.com>
Date: Fri, 19 Feb 2021 13:09:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
	Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210217125845.10319-2-jlayton@kernel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-cachefs@redhat.com
Cc: linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org,
	linux-cachefs@redhat.com
Subject: Re: [Linux-cachefs] [PATCH v2 1/6] ceph: disable old fscache
	readpage handling
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

On 2021/2/17 20:58, Jeff Layton wrote:
> With the new netfs read helper functions, we won't need a lot of this
> infrastructure as it handles the pagecache pages itself. Rip out the
> read handling for now, and much of the old infrastructure that deals in
> individual pages.
>
> The cookie handling is mostly unchanged, however.
>
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> Cc: ceph-devel@vger.kernel.org
> Cc: linux-cachefs@redhat.com
> Cc: linux-fsdevel@vger.kernel.org
> ---
>   fs/ceph/addr.c  |  31 +-----------
>   fs/ceph/cache.c | 125 ------------------------------------------------
>   fs/ceph/cache.h |  91 +----------------------------------
>   fs/ceph/caps.c  |   9 ----
>   4 files changed, 3 insertions(+), 253 deletions(-)
>
> diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
> index 950552944436..2b17bb36e548 100644
> --- a/fs/ceph/addr.c
> +++ b/fs/ceph/addr.c
> @@ -155,8 +155,6 @@ static void ceph_invalidatepage(struct page *page, unsigned int offset,
>   		return;
>   	}
>   
> -	ceph_invalidate_fscache_page(inode, page);
> -
>   	WARN_ON(!PageLocked(page));
>   	if (!PagePrivate(page))
>   		return;
> @@ -175,10 +173,6 @@ static int ceph_releasepage(struct page *page, gfp_t g)
>   	dout("%p releasepage %p idx %lu (%sdirty)\n", page->mapping->host,
>   	     page, page->index, PageDirty(page) ? "" : "not ");
>   
> -	/* Can we release the page from the cache? */
> -	if (!ceph_release_fscache_page(page, g))
> -		return 0;
> -
>   	return !PagePrivate(page);
>   }
>   
> @@ -213,10 +207,6 @@ static int ceph_do_readpage(struct file *filp, struct page *page)
>   		return 0;
>   	}
>   
> -	err = ceph_readpage_from_fscache(inode, page);
> -	if (err == 0)
> -		return -EINPROGRESS;
> -
>   	dout("readpage ino %llx.%llx file %p off %llu len %llu page %p index %lu\n",
>   	     vino.ino, vino.snap, filp, off, len, page, page->index);
>   	req = ceph_osdc_new_request(osdc, &ci->i_layout, vino, off, &len, 0, 1,
> @@ -241,7 +231,6 @@ static int ceph_do_readpage(struct file *filp, struct page *page)
>   	if (err == -ENOENT)
>   		err = 0;
>   	if (err < 0) {
> -		ceph_fscache_readpage_cancel(inode, page);
>   		if (err == -EBLOCKLISTED)
>   			fsc->blocklisted = true;
>   		goto out;
> @@ -253,8 +242,6 @@ static int ceph_do_readpage(struct file *filp, struct page *page)
>   		flush_dcache_page(page);
>   
>   	SetPageUptodate(page);
> -	ceph_readpage_to_fscache(inode, page);
> -
>   out:
>   	return err < 0 ? err : 0;
>   }
> @@ -294,10 +281,8 @@ static void finish_read(struct ceph_osd_request *req)
>   	for (i = 0; i < num_pages; i++) {
>   		struct page *page = osd_data->pages[i];
>   
> -		if (rc < 0 && rc != -ENOENT) {
> -			ceph_fscache_readpage_cancel(inode, page);
> +		if (rc < 0 && rc != -ENOENT)
>   			goto unlock;
> -		}
>   		if (bytes < (int)PAGE_SIZE) {
>   			/* zero (remainder of) page */
>   			int s = bytes < 0 ? 0 : bytes;
> @@ -307,7 +292,6 @@ static void finish_read(struct ceph_osd_request *req)
>   		     page->index);
>   		flush_dcache_page(page);
>   		SetPageUptodate(page);
> -		ceph_readpage_to_fscache(inode, page);
>   unlock:
>   		unlock_page(page);
>   		put_page(page);
> @@ -408,7 +392,6 @@ static int start_read(struct inode *inode, struct ceph_rw_context *rw_ctx,
>   		     page->index);
>   		if (add_to_page_cache_lru(page, &inode->i_data, page->index,
>   					  GFP_KERNEL)) {
> -			ceph_fscache_uncache_page(inode, page);
>   			put_page(page);
>   			dout("start_read %p add_to_page_cache failed %p\n",
>   			     inode, page);
> @@ -440,10 +423,8 @@ static int start_read(struct inode *inode, struct ceph_rw_context *rw_ctx,
>   	return nr_pages;
>   
>   out_pages:
> -	for (i = 0; i < nr_pages; ++i) {
> -		ceph_fscache_readpage_cancel(inode, pages[i]);
> +	for (i = 0; i < nr_pages; ++i)
>   		unlock_page(pages[i]);
> -	}
>   	ceph_put_page_vector(pages, nr_pages, false);
>   out_put:
>   	ceph_osdc_put_request(req);
> @@ -471,12 +452,6 @@ static int ceph_readpages(struct file *file, struct address_space *mapping,
>   	if (ceph_inode(inode)->i_inline_version != CEPH_INLINE_NONE)
>   		return -EINVAL;
>   
> -	rc = ceph_readpages_from_fscache(mapping->host, mapping, page_list,
> -					 &nr_pages);
> -
> -	if (rc == 0)
> -		goto out;
> -
>   	rw_ctx = ceph_find_rw_context(fi);
>   	max = fsc->mount_options->rsize >> PAGE_SHIFT;
>   	dout("readpages %p file %p ctx %p nr_pages %d max %d\n",
> @@ -487,8 +462,6 @@ static int ceph_readpages(struct file *file, struct address_space *mapping,
>   			goto out;
>   	}
>   out:
> -	ceph_fscache_readpages_cancel(inode, page_list);
> -
>   	dout("readpages %p file %p ret %d\n", inode, file, rc);
>   	return rc;
>   }
> diff --git a/fs/ceph/cache.c b/fs/ceph/cache.c
> index 2f5cb6bc78e1..9cfadbb86568 100644
> --- a/fs/ceph/cache.c
> +++ b/fs/ceph/cache.c
> @@ -173,7 +173,6 @@ void ceph_fscache_unregister_inode_cookie(struct ceph_inode_info* ci)
>   
>   	ci->fscache = NULL;
>   
> -	fscache_uncache_all_inode_pages(cookie, &ci->vfs_inode);
>   	fscache_relinquish_cookie(cookie, &ci->i_vino, false);
>   }
>   
> @@ -194,7 +193,6 @@ void ceph_fscache_file_set_cookie(struct inode *inode, struct file *filp)
>   		dout("fscache_file_set_cookie %p %p disabling cache\n",
>   		     inode, filp);
>   		fscache_disable_cookie(ci->fscache, &ci->i_vino, false);
> -		fscache_uncache_all_inode_pages(ci->fscache, inode);
>   	} else {
>   		fscache_enable_cookie(ci->fscache, &ci->i_vino, i_size_read(inode),
>   				      ceph_fscache_can_enable, inode);
> @@ -205,108 +203,6 @@ void ceph_fscache_file_set_cookie(struct inode *inode, struct file *filp)
>   	}
>   }
>   
> -static void ceph_readpage_from_fscache_complete(struct page *page, void *data, int error)
> -{
> -	if (!error)
> -		SetPageUptodate(page);
> -
> -	unlock_page(page);
> -}
> -
> -static inline bool cache_valid(struct ceph_inode_info *ci)
> -{
> -	return ci->i_fscache_gen == ci->i_rdcache_gen;
> -}
> -

Hi Jeff,

Please delete the "i_fscache_gen" member from the struct ceph_inode_info 
if we are not using it any more.

Thanks

Xiubo


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

