Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id EA089303157
	for <lists+linux-cachefs@lfdr.de>; Tue, 26 Jan 2021 02:38:13 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-9BaJGjAePF--jRMiPkTMdA-1; Mon, 25 Jan 2021 20:38:11 -0500
X-MC-Unique: 9BaJGjAePF--jRMiPkTMdA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AEC921005513;
	Tue, 26 Jan 2021 01:38:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9194E5F9B7;
	Tue, 26 Jan 2021 01:38:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C39A24BB7B;
	Tue, 26 Jan 2021 01:38:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10Q1btlY021302 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 25 Jan 2021 20:37:55 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 436B8637A1; Tue, 26 Jan 2021 01:37:55 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3DE7D1731B
	for <linux-cachefs@redhat.com>; Tue, 26 Jan 2021 01:37:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E57621010428
	for <linux-cachefs@redhat.com>; Tue, 26 Jan 2021 01:37:52 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-408-BWFrvhzAN7uhRtGE5HdfhQ-1; Mon, 25 Jan 2021 20:37:51 -0500
X-MC-Unique: BWFrvhzAN7uhRtGE5HdfhQ-1
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1l4DH9-004uVe-DU; Tue, 26 Jan 2021 01:36:32 +0000
Date: Tue, 26 Jan 2021 01:36:11 +0000
From: Matthew Wilcox <willy@infradead.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <20210126013611.GI308988@casper.infradead.org>
References: <161161025063.2537118.2009249444682241405.stgit@warthog.procyon.org.uk>
	<161161064956.2537118.3354798147866150631.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <161161064956.2537118.3354798147866150631.stgit@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-afs@lists.infradead.org, Dominique Martinet <asmadeus@codewreck.org>,
	linux-kernel@vger.kernel.org, Anna Schumaker <anna.schumaker@netapp.com>,
	Steve French <sfrench@samba.org>, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org
Subject: Re: [Linux-cachefs] [PATCH 32/32] NFS: Convert readpage to
 readahead and use netfs_readahead for fscache
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


For Subject: s/readpage/readpages/

On Mon, Jan 25, 2021 at 09:37:29PM +0000, David Howells wrote:
> +int __nfs_readahead_from_fscache(struct nfs_readdesc *desc,
> +				 struct readahead_control *rac)

I thought you wanted it called ractl instead of rac?  That's what I've
been using in new code.

> -	dfprintk(FSCACHE, "NFS: nfs_getpages_from_fscache (0x%p/%u/0x%p)\n",
> -		 nfs_i_fscache(inode), npages, inode);
> +	dfprintk(FSCACHE, "NFS: nfs_readahead_from_fscache (0x%p/0x%p)\n",
> +		 nfs_i_fscache(inode), inode);

We do have readahead_count() if this is useful information to be logging.

> +static inline int nfs_readahead_from_fscache(struct nfs_readdesc *desc,
> +					     struct readahead_control *rac)
>  {
> -	if (NFS_I(inode)->fscache)
> -		return __nfs_readpages_from_fscache(ctx, inode, mapping, pages,
> -						    nr_pages);
> +	if (NFS_I(rac->mapping->host)->fscache)
> +		return __nfs_readahead_from_fscache(desc, rac);
>  	return -ENOBUFS;
>  }

Not entirely sure that it's worth having the two functions separated any more.

>  	/* attempt to read as many of the pages as possible from the cache
>  	 * - this returns -ENOBUFS immediately if the cookie is negative
>  	 */
> -	ret = nfs_readpages_from_fscache(desc.ctx, inode, mapping,
> -					 pages, &nr_pages);
> +	ret = nfs_readahead_from_fscache(&desc, rac);
>  	if (ret == 0)
>  		goto read_complete; /* all pages were read */
>  
>  	nfs_pageio_init_read(&desc.pgio, inode, false,
>  			     &nfs_async_read_completion_ops);
>  
> -	ret = read_cache_pages(mapping, pages, readpage_async_filler, &desc);
> +	while ((page = readahead_page(rac))) {
> +		ret = readpage_async_filler(&desc, page);
> +		put_page(page);
> +	}

I thought with the new API we didn't need to do this kind of thing
any more?  ie no matter whether fscache is configured in or not, it'll
submit the I/Os.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

