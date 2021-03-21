Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 68549343080
	for <lists+linux-cachefs@lfdr.de>; Sun, 21 Mar 2021 02:42:39 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-_GRseUGXNDiagZQ_KrsqXA-1; Sat, 20 Mar 2021 21:42:36 -0400
X-MC-Unique: _GRseUGXNDiagZQ_KrsqXA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 910A08064A5;
	Sun, 21 Mar 2021 01:42:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A11EA60BF1;
	Sun, 21 Mar 2021 01:42:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 30D8E4BB7C;
	Sun, 21 Mar 2021 01:42:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12L1gOJU030411 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sat, 20 Mar 2021 21:42:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3EF2A2026D60; Sun, 21 Mar 2021 01:42:24 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 397CD2026D46
	for <linux-cachefs@redhat.com>; Sun, 21 Mar 2021 01:42:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B079A80B921
	for <linux-cachefs@redhat.com>; Sun, 21 Mar 2021 01:42:21 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-365-sNDqg4asOn6YXxxGNnkAXQ-1; Sat, 20 Mar 2021 21:42:16 -0400
X-MC-Unique: sNDqg4asOn6YXxxGNnkAXQ-1
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lNn6Q-006Ymd-I3; Sun, 21 Mar 2021 01:42:05 +0000
Date: Sun, 21 Mar 2021 01:42:02 +0000
From: Matthew Wilcox <willy@infradead.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <20210321014202.GF3420@casper.infradead.org>
References: <161539526152.286939.8589700175877370401.stgit@warthog.procyon.org.uk>
	<161539537375.286939.16642940088716990995.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <161539537375.286939.16642940088716990995.stgit@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	Dominique Martinet <asmadeus@codewreck.org>,
	linux-kernel@vger.kernel.org, linux-afs@lists.infradead.org,
	Steve French <sfrench@samba.org>, linux-mm@kvack.org,
	linux-cachefs@redhat.com, Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH v4 08/28] netfs: Provide readahead and
 readpage netfs helpers
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Mar 10, 2021 at 04:56:13PM +0000, David Howells wrote:
> +void netfs_readahead(struct readahead_control *ractl,
> +		     const struct netfs_read_request_ops *ops,
> +		     void *netfs_priv)
> +{
> +	struct netfs_read_request *rreq;
> +	struct page *page;
> +	unsigned int debug_index = 0;
> +
> +	_enter("%lx,%x", readahead_index(ractl), readahead_count(ractl));
> +
> +	if (readahead_count(ractl) == 0)
> +		goto cleanup;
> +
> +	rreq = netfs_alloc_read_request(ops, netfs_priv, ractl->file);
> +	if (!rreq)
> +		goto cleanup;
> +	rreq->mapping	= ractl->mapping;
> +	rreq->start	= readahead_pos(ractl);
> +	rreq->len	= readahead_length(ractl);
> +
> +	netfs_rreq_expand(rreq, ractl);
> +
> +	atomic_set(&rreq->nr_rd_ops, 1);
> +	do {
> +		if (!netfs_rreq_submit_slice(rreq, &debug_index))
> +			break;
> +
> +	} while (rreq->submitted < rreq->len);
> +
> +	while ((page = readahead_page(ractl)))
> +		put_page(page);

You don't need this pair of lines (unless I'm missing something).
read_pages() in mm/readahead.c puts the reference and unlocks any
pages which are not read by the readahead op.  Indeed, I think doing
this is buggy because you don't unlock the page.

> +	/* If we decrement nr_rd_ops to 0, the ref belongs to us. */
> +	if (atomic_dec_and_test(&rreq->nr_rd_ops))
> +		netfs_rreq_assess(rreq, false);
> +	return;
> +
> +cleanup:
> +	if (netfs_priv)
> +		ops->cleanup(ractl->mapping, netfs_priv);
> +	return;
> +}
> +EXPORT_SYMBOL(netfs_readahead);

> +int netfs_readpage(struct file *file,
> +		   struct page *page,
> +		   const struct netfs_read_request_ops *ops,
> +		   void *netfs_priv)
> +{
> +	struct netfs_read_request *rreq;
> +	unsigned int debug_index = 0;
> +	int ret;
> +
> +	_enter("%lx", page->index);
> +
> +	rreq = netfs_alloc_read_request(ops, netfs_priv, file);
> +	if (!rreq) {
> +		if (netfs_priv)
> +			ops->cleanup(netfs_priv, page->mapping);
> +		unlock_page(page);
> +		return -ENOMEM;
> +	}
> +	rreq->mapping	= page->mapping;

FYI, this isn't going to work with swap-over-NFS.  You have to use
page_file_mapping().

> +	rreq->start	= page->index * PAGE_SIZE;

and page_index() here.

I rather dislike it that swap-over-NFS uses readpage which makes this
need to exist.  If somebody were to switch SWP_FS_OPS to using kiocbs,
some of this pain could go away.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

