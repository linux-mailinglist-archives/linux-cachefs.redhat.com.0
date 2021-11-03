Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7154445F1
	for <lists+linux-cachefs@lfdr.de>; Wed,  3 Nov 2021 17:30:50 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535-fmjZJbuRN860ukTaYboXiQ-1; Wed, 03 Nov 2021 12:30:46 -0400
X-MC-Unique: fmjZJbuRN860ukTaYboXiQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B50568066F5;
	Wed,  3 Nov 2021 16:30:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0179F5BAF0;
	Wed,  3 Nov 2021 16:30:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 434DD1803B30;
	Wed,  3 Nov 2021 16:30:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1A3GUcGJ011779 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 3 Nov 2021 12:30:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3553B112131E; Wed,  3 Nov 2021 16:30:38 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C1541121324
	for <linux-cachefs@redhat.com>; Wed,  3 Nov 2021 16:30:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 45916802813
	for <linux-cachefs@redhat.com>; Wed,  3 Nov 2021 16:30:35 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-80-8wL5gmMhOgmZjW1VvjVbng-1; Wed, 03 Nov 2021 12:30:33 -0400
X-MC-Unique: 8wL5gmMhOgmZjW1VvjVbng-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
	Hat Linux)) id 1miJ6W-005Jo8-KL; Wed, 03 Nov 2021 16:27:44 +0000
Date: Wed, 3 Nov 2021 16:27:12 +0000
From: Matthew Wilcox <willy@infradead.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <YYK4YKCnDyoJx5eW@casper.infradead.org>
References: <YYKa3bfQZxK5/wDN@casper.infradead.org>
	<163584174921.4023316.8927114426959755223.stgit@warthog.procyon.org.uk>
	<163584187452.4023316.500389675405550116.stgit@warthog.procyon.org.uk>
	<1038257.1635951492@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <1038257.1635951492@warthog.procyon.org.uk>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Nov 03, 2021 at 02:58:12PM +0000, David Howells wrote:
> Matthew Wilcox <willy@infradead.org> wrote:
> 
> > > +	len = (size >= start + gran) ? gran : size - start;
> > 
> > This seems like the most complicated way to write this ... how about:
> > 
> >         size_t len = min_t(loff_t, isize - start, folio_size(folio));
> 
> I was trying to hedge against isize-start going negative.  Can this code race
> against truncate?  truncate_setsize() changes i_size *before* invalidating the
> pages.

We should check for isize < start separately, and skip the writeback
entirely.

> > >  static int afs_symlink_readpage(struct file *file, struct page *page)
> > >  {
> > > -	struct afs_vnode *vnode = AFS_FS_I(page->mapping->host);
> > > +	struct afs_vnode *vnode = AFS_FS_I(page_mapping(page)->host);
> > 
> > How does swap end up calling readpage on a symlink?
> 
> Um - readpage is called to read the symlink.

But the only reason to use page_mapping() instead of page->mapping
is if you don't know that the page is in the page cache.  You know
that here, so I don't understand why you changed it.

> > > -	page_endio(page, false, ret);
> > > +	page_endio(&folio->page, false, ret);
> > 
> > We need a folio_endio() ...
> 
> I think we mentioned this before and I think you said you had or would make a
> patch for it.  I can just create a wrapper for it if that'll do.

Probably better to convert it and put a page_endio wrapper in
folio-compat.c

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

