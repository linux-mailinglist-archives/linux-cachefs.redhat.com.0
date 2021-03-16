Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 63BBD33E225
	for <lists+linux-cachefs@lfdr.de>; Wed, 17 Mar 2021 00:33:38 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-Azh5V4GIORiMLl_bw8E9Hg-1; Tue, 16 Mar 2021 19:33:35 -0400
X-MC-Unique: Azh5V4GIORiMLl_bw8E9Hg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE7C73FD2;
	Tue, 16 Mar 2021 23:33:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8FF016B8DC;
	Tue, 16 Mar 2021 23:33:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C3D4418155DE;
	Tue, 16 Mar 2021 23:33:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12GNXPRe021782 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 16 Mar 2021 19:33:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3B9C52024CD0; Tue, 16 Mar 2021 23:33:25 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 36BF92026D48
	for <linux-cachefs@redhat.com>; Tue, 16 Mar 2021 23:33:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 075EB800883
	for <linux-cachefs@redhat.com>; Tue, 16 Mar 2021 23:33:23 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-156-d-olxdJZMmmZeRRJ9nwU5w-1; Tue, 16 Mar 2021 19:33:19 -0400
X-MC-Unique: d-olxdJZMmmZeRRJ9nwU5w-1
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lMJB6-000lEX-7N; Tue, 16 Mar 2021 23:32:48 +0000
Date: Tue, 16 Mar 2021 23:32:44 +0000
From: Matthew Wilcox <willy@infradead.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <20210316233244.GE3420@casper.infradead.org>
References: <20210316190707.GD3420@casper.infradead.org>
	<161539526152.286939.8589700175877370401.stgit@warthog.procyon.org.uk>
	<161539528910.286939.1252328699383291173.stgit@warthog.procyon.org.uk>
	<3313319.1615927080@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <3313319.1615927080@warthog.procyon.org.uk>
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
	linux-afs@lists.infradead.org, Dominique Martinet <asmadeus@codewreck.org>,
	linux-kernel@vger.kernel.org, Anna Schumaker <anna.schumaker@netapp.com>,
	Steve French <sfrench@samba.org>, linux-mm@kvack.org,
	linux-cachefs@redhat.com, Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [Linux-cachefs] [PATCH v4 02/28] mm: Add an unlock function for
 PG_private_2/PG_fscache
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

On Tue, Mar 16, 2021 at 08:38:00PM +0000, David Howells wrote:
> Matthew Wilcox <willy@infradead.org> wrote:
> 
> > So ... a page with both flags cleared should have a refcount of N.
> > A page with one or both flags set should have a refcount of N+1.
> > ...
> > How is a poor filesystem supposed to make that true?  Also btrfs has this
> > problem since it uses private_2 for its own purposes.
> 
> It's simpler if it's N+2 for both patches set.  Btw, patch 13 adds that - and
> possibly that should be merged into an earlier patch.

So ...

static inline int page_has_private(struct page *page)
{
	unsigned long flags = page->flags;
	return ((flags >> PG_private) & 1) + ((flags >> PG_private_2) & 1);
}

perhaps?

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

