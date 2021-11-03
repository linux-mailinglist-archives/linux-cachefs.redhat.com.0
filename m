Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1505D444370
	for <lists+linux-cachefs@lfdr.de>; Wed,  3 Nov 2021 15:26:47 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-Y_0JbwlKME20X5uefZGBVw-1; Wed, 03 Nov 2021 10:26:43 -0400
X-MC-Unique: Y_0JbwlKME20X5uefZGBVw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7AC9101F005;
	Wed,  3 Nov 2021 14:26:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C6FDB60C05;
	Wed,  3 Nov 2021 14:26:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4E3401809C84;
	Wed,  3 Nov 2021 14:26:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1A3EQTh5032626 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 3 Nov 2021 10:26:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A665C112131F; Wed,  3 Nov 2021 14:26:29 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F8D11121315
	for <linux-cachefs@redhat.com>; Wed,  3 Nov 2021 14:26:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DAF721078463
	for <linux-cachefs@redhat.com>; Wed,  3 Nov 2021 14:26:23 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-324-_lhEz7IEMBK8Lf4A1LFtRg-1; Wed, 03 Nov 2021 10:26:21 -0400
X-MC-Unique: _lhEz7IEMBK8Lf4A1LFtRg-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
	Hat Linux)) id 1miH8f-005FeW-AM; Wed, 03 Nov 2021 14:21:52 +0000
Date: Wed, 3 Nov 2021 14:21:17 +0000
From: Matthew Wilcox <willy@infradead.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <YYKa3bfQZxK5/wDN@casper.infradead.org>
References: <163584174921.4023316.8927114426959755223.stgit@warthog.procyon.org.uk>
	<163584187452.4023316.500389675405550116.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <163584187452.4023316.500389675405550116.stgit@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org, linux-mm@kvack.org,
	Dominique Martinet <asmadeus@codewreck.org>,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org,
	linux-cachefs@redhat.com, Marc Dionne <marc.dionne@auristor.com>,
	v9fs-developer@lists.sourceforge.net,
	Ilya Dryomov <idryomov@gmail.com>, linux-afs@lists.infradead.org,
	devel@lists.orangefs.org
Subject: Re: [Linux-cachefs] [PATCH v3 5/6] netfs, 9p, afs, ceph: Use folios
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

On Tue, Nov 02, 2021 at 08:31:14AM +0000, David Howells wrote:
> -static int v9fs_vfs_writepage_locked(struct page *page)
> +static int v9fs_vfs_write_folio_locked(struct folio *folio)
>  {
> -	struct inode *inode = page->mapping->host;
> +	struct inode *inode = folio_inode(folio);
>  	struct v9fs_inode *v9inode = V9FS_I(inode);
> -	loff_t start = page_offset(page);
> +	loff_t start = folio_pos(folio);
>  	loff_t size = i_size_read(inode);
>  	struct iov_iter from;
> -	int err, len;
> +	size_t gran = folio_size(folio), len;
> +	int err;
>  
> -	if (page->index == size >> PAGE_SHIFT)
> -		len = size & ~PAGE_MASK;
> -	else
> -		len = PAGE_SIZE;
> +	len = (size >= start + gran) ? gran : size - start;

This seems like the most complicated way to write this ... how about:

        size_t len = min_t(loff_t, isize - start, folio_size(folio));

> @@ -322,23 +322,24 @@ static void afs_req_issue_op(struct netfs_read_subrequest *subreq)
>  
>  static int afs_symlink_readpage(struct file *file, struct page *page)
>  {
> -	struct afs_vnode *vnode = AFS_FS_I(page->mapping->host);
> +	struct afs_vnode *vnode = AFS_FS_I(page_mapping(page)->host);

How does swap end up calling readpage on a symlink?

>  	ret = afs_fetch_data(fsreq->vnode, fsreq);
> -	page_endio(page, false, ret);
> +	page_endio(&folio->page, false, ret);

We need a folio_endio() ...

>  int afs_write_end(struct file *file, struct address_space *mapping,
>  		  loff_t pos, unsigned len, unsigned copied,
> -		  struct page *page, void *fsdata)
> +		  struct page *subpage, void *fsdata)
>  {
> +	struct folio *folio = page_folio(subpage);
>  	struct afs_vnode *vnode = AFS_FS_I(file_inode(file));
>  	unsigned long priv;
> -	unsigned int f, from = pos & (thp_size(page) - 1);
> +	unsigned int f, from = pos & (folio_size(folio) - 1);

Isn't that:

	size_t from = offset_in_folio(folio, pos);

(not that i think we're getting folios larger than 4GB any time soon,
but it'd be nice to be prepared for it)

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

