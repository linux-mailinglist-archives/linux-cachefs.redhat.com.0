Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id C8EEB233144
	for <lists+linux-cachefs@lfdr.de>; Thu, 30 Jul 2020 13:51:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596109905;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hgGCK2EJRclTSGftKq/aMuRhsuPKZEHdF5Qw1ToVrSM=;
	b=RLYkC/MkXvDWSfL7/PF72In1ggK3yv9EBAKYW3vl3JbJB9R57d5JW/ZV4d7ax17wz9fBQ3
	e72e4YOE3MYVproQDh0q1c3QQgsgjo4S9Bjv1IacXqG8GnYJGFhYFujVTgdqwYOUit3nP0
	xJ9k0w9RWVO0atCzBWiIQmfNii2anwM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-Q44DjBXwN6uq4_k1nfuCNQ-1; Thu, 30 Jul 2020 07:51:43 -0400
X-MC-Unique: Q44DjBXwN6uq4_k1nfuCNQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7186110059B6;
	Thu, 30 Jul 2020 11:51:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 438315DA6B;
	Thu, 30 Jul 2020 11:51:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4C4F21809554;
	Thu, 30 Jul 2020 11:51:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06UBpYI0030847 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 30 Jul 2020 07:51:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0B6811053B01; Thu, 30 Jul 2020 11:51:34 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-32.rdu2.redhat.com
	[10.10.112.32])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ABF8B10002CA;
	Thu, 30 Jul 2020 11:51:16 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: torvalds@linux-foundation.org
MIME-Version: 1.0
Content-ID: <447451.1596109876.1@warthog.procyon.org.uk>
Date: Thu, 30 Jul 2020 12:51:16 +0100
Message-ID: <447452.1596109876@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 06UBpYI0030847
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
	Anna Schumaker <anna.schumaker@netapp.com>, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>
Subject: [Linux-cachefs] Upcoming: fscache rewrite
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Linus, Trond/Anna, Steve, Eric,

I have an fscache rewrite that I'm tempted to put in for the next merge
window:

	https://lore.kernel.org/linux-fsdevel/159465784033.1376674.18106463693989811037.stgit@warthog.procyon.org.uk/

It improves the code by:

 (*) Ripping out the stuff that uses page cache snooping and kernel_write()
     and using kiocb instead.  This gives multiple wins: uses async DIO rather
     than snooping for updated pages and then copying them, less VM overhead.

 (*) Object management is also simplified, getting rid of the state machine
     that was managing things and using a much simplified thread pool instead.

 (*) Object invalidation creates a tmpfile and diverts new activity to that so
     that it doesn't have to synchronise in-flight ADIO.

 (*) Using a bitmap stored in an xattr rather than using bmap to find out if
     a block is present in the cache.  Probing the backing filesystem's
     metadata to find out is not reliable in modern extent-based filesystems
     as them may insert or remove blocks of zeros.  Even SEEK_HOLE/SEEK_DATA
     are problematic since they don't distinguish transparently inserted
     bridging.

I've provided a read helper that handles ->readpage, ->readpages, and
preparatory writes in ->write_begin.  Willy is looking at using this as a way
to roll his new ->readahead op out into filesystems.  A good chunk of this
will move into MM code.

The code is simpler, and this is nice too:

 67 files changed, 5947 insertions(+), 8294 deletions(-)

not including documentation changes, which I need to convert to rst format
yet.  That removes a whole bunch more lines.

But there are reasons you might not want to take it yet:

 (1) It starts off by disabling fscache support in all the filesystems that
     use it: afs, nfs, cifs, ceph and 9p.  I've taken care of afs, Dave
     Wysochanski has patches for nfs:

	https://lore.kernel.org/linux-nfs/1596031949-26793-1-git-send-email-dwysocha@redhat.com/

     but they haven't been reviewed by Trond or Anna yet, and Jeff Layton has
     patches for ceph:

	https://marc.info/?l=ceph-devel&m=159541538914631&w=2

     and I've briefly discussed cifs with Steve, but nothing has started there
     yet.  9p I've not looked at yet.

     Now, if we're okay for going a kernel release with 4/5 filesystems with
     caching disabled and then pushing the changes for individual filesystems
     through their respective trees, it might be easier.

     Unfortunately, I wasn't able to get together with Trond and Anna at LSF
     to discuss this.

 (2) The patched afs fs passed xfstests -g quick (unlike the upstream code
     that oopses pretty quickly with caching enabled).  Dave and Jeff's nfs
     and ceph code is getting close, but not quite there yet.

 (3) Al has objections to the ITER_MAPPING iov_iter type that I added

	https://lore.kernel.org/linux-fsdevel/20200719014436.GG2786714@ZenIV.linux.org.uk/

     but note that iov_iter_for_each_range() is not actually used by anything.

     However, Willy likes it and would prefer to make it ITER_XARRAY instead
     as he might be able to use it in other places, though there's an issue
     where I'm calling find_get_pages_contig() which takes a mapping (though
     all it does is then get the xarray out of it).

     Instead I would have to use ITER_BVEC, which has quite a high overhead,
     though it would mean that the RCU read lock wouldn't be necessary.  This
     would require 1K of memory for every 256K block the cache wants to read;
     for any read >1M, I'd have to use vmalloc() instead.

     I'd also prefer not to use ITER_BVEC because the offset and length are
     superfluous here.  If ITER_MAPPING is not good, would it be possible to
     have an ITER_PAGEARRAY that just takes a page array instead?  Or, even,
     create a transient xarray?

 (4) The way object culling is managed needs overhauling too, but that's a
     whole 'nother patchset.  We could wait till that's done too, but its lack
     doesn't prevent what we have now being used.

Thoughts?

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

