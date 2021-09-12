Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id EB9BD407D93
	for <lists+linux-cachefs@lfdr.de>; Sun, 12 Sep 2021 15:24:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631453080;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uDaD8fi704agrNl99I4Mj+opikNrIKG93cDN9puzbZo=;
	b=VrEV6P7XqGh/DmlJBQglttg0utxpYppwiNoO6NSLmLKAnawLmNj+IcQ1kKCVSVp+vEa9hP
	NxW1B5jljRENtEzVSRSMz6/jXrQE1Xtoiq1hgvzRt8Y4SUtsk1X2h/Kj/z+tEGhJuYT4Ln
	5FSF2rV/qHDyzXch5SzqBduUDO/HTBs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-mrDjbM9vOEmZqsW4fpG_9w-1; Sun, 12 Sep 2021 09:24:38 -0400
X-MC-Unique: mrDjbM9vOEmZqsW4fpG_9w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 572DB1084683;
	Sun, 12 Sep 2021 13:24:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E709577F2D;
	Sun, 12 Sep 2021 13:24:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 58DB01809C81;
	Sun, 12 Sep 2021 13:24:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18CDLEux011627 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sun, 12 Sep 2021 09:21:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BC3052B0B7; Sun, 12 Sep 2021 13:21:14 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0A8081B472;
	Sun, 12 Sep 2021 13:21:07 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: Johannes Weiner <hannes@cmpxchg.org>
MIME-Version: 1.0
Date: Sun, 12 Sep 2021 14:21:07 +0100
Message-ID: <1086693.1631452867@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 18CDLEux011627
X-loop: linux-cachefs@redhat.com
Cc: Christoph Hellwig <hch@infradead.org>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org,
	linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Kent Overstreet <kent.overstreet@gmail.com>
Subject: [Linux-cachefs] Decoupling filesystems from pages
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
Content-ID: <1086692.1631452867.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Johannes,

> Wouldn't it make more sense to decouple filesystems from "paginess",
> as David puts it, now instead? Avoid the risk of doing it twice, avoid
> the more questionable churn inside mm code, avoid the confusing
> proximity to the page and its API in the long-term...

Let me seize that opening.  I've been working on doing this for network
filesystems - at least those that want to buy in.  If you look here:

https://lore.kernel.org/ceph-devel/162687506932.276387.14456718890524355509.stgit@warthog.procyon.org.uk/T/#m23428c315a77d8c5206b9646bf74c8ef18d4d38c

the current state of which is here:

https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=netfs-folio-regions

I've been looking at abstracting anything to do with pages out of the netfs
and putting that stuff into a helper library.  The library handles all the
caching stuff and just presents the filesystem with requests to read
into/write from an iov_iter.  The filesystem doesn't then see pages at all.

The motivation behind this is to make content encryption and compression
transparent and automatically available to all participating filesystems -
with the requirement that the data stored in the local disk cache
(ie. fscache) is *also* encrypted.

I have content encryption working for basic read and write on afs and Jeff
Layton is looking at how to make it work with ceph - but it's very much a work
in progress and things like truncate and mmap don't yet work with it.

Anyway, the library, as I'm currently writing it, maintains a list of
byte-range dirty regions on each inode, where a dirty region may span multiple
folios and a folio may be contributory to multiple regions.  The fact that
pages are involved is really then merely an implementation detail

Content encryption/compression blocks may be any power-of-2 size, from 2 bytes
to megabytes, and this need bear no relation to page size.  The library calls
the crypto hooks for each crypto block in the chunk[*] to be crypted.

[*] Terminology is such fun.  I have to deal with pages, crypto blocks, object
    layout blocks, I/O blocks (rsize/wsize settings), regions.

In fact ->readpage(), ->writepage() and ->launder_page() are difficult when I
may be required to deal with blocks larger than the size of a page.  The page
being poked may be in the middle of a block, so I'm endeavouring to work
around that.  Using the regions should allow me to 'launder' an inode before
invalidating the pages attached to it, and the dirty region objects can act
instead of the dirty, writeback and fscache flags on a page.

I've been building this on top of Willy's folio patchset, and so I've paused
for the moment whilst I wait to see what becomes of that.  If folios doesn't
get in or gets renamed, I have a load of reworking to do.

Does this sound like something you'd be interested in looking at more
generally than just network filesystems?

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

