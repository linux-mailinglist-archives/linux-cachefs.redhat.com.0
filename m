Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id A534E2F5F1C
	for <lists+linux-cachefs@lfdr.de>; Thu, 14 Jan 2021 11:45:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1610621126;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=txX4CtVkFBb9cruJq0ArzbZAi1v0SvVGiMZxip0YwRU=;
	b=PX1X8eajNMp2FiXMMf0p31Rh7Z/dF/XHzkh7M2JW7dockOOeoUQTrJzaJiMsNqNI8aYjVw
	ogya19uL1nEojH9POE8R0By3Q+6GwcUKMOxb6o0/Z0y7KrKQ0EndH9uQ1uNrVlPz7KES87
	WBmroOuSzSCi+5lXGsn2iKJ4BRGR6sU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-dfwGonxCOlC8ZZMm09KXqg-1; Thu, 14 Jan 2021 05:45:24 -0500
X-MC-Unique: dfwGonxCOlC8ZZMm09KXqg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F5A5100C661;
	Thu, 14 Jan 2021 10:45:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B110319C47;
	Thu, 14 Jan 2021 10:45:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6FA84180954D;
	Thu, 14 Jan 2021 10:45:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10EAjEks001468 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 14 Jan 2021 05:45:14 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0FAC560C6A; Thu, 14 Jan 2021 10:45:14 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-8.rdu2.redhat.com
	[10.10.112.8])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9402F60C64;
	Thu, 14 Jan 2021 10:45:06 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com
MIME-Version: 1.0
Date: Thu, 14 Jan 2021 10:45:06 +0000
Message-ID: <2758811.1610621106@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	dchinner@redhat.com, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>, Dominique Martinet <asmadeus@codewreck.org>
Subject: [Linux-cachefs] Redesigning and modernising fscache
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <2758810.1610621106.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

I've been working on modernising fscache, primarily with help from Jeff Layton
and Dave Wysochanski with porting Ceph and NFS to it, and with Willy helpfully
reinventing the VM I/O interface beneath us;-).

However, there've been some objections to the approach I've taken to
implementing this.  The way I've done it is to disable the use of fscache by
the five network filesystems that use it, remove much of the old code, put in
the reimplementation, then cut the filesystems over.  I.e. rip-and-replace.
It leaves unported filesystems unable to use it - but three of the five are
done (afs, ceph, nfs), and I've supplied partially-done patches for the other
two (9p, cifs).

It's been suggested that it's too hard to review this way and that either I
should go for a gradual phasing in or build the new one in parallel.  The
first is difficult because I want to change how almost everything in there
works - but the parts are tied together; the second is difficult because there
are areas that would *have* to overlap (the UAPI device file, the cache
storage, the cache size limits and at least some state for managing these), so
there would have to be interaction between the two variants.  One refinement
of the latter would be to make the two implementations mutually exclusive: you
can build one or the other, but not both.

However.  Given that I want to replace the on-disk format in cachefiles at
some point, and change what the userspace component does, maybe I should
create a new, separate UAPI interface and do the on-disk format change at the
same time.  In which case, it makes sense to build a parallel variant


Anyway, a bit of background into the why.  There are a number of things that
need to be fixed in fscache/cachefiles:

 (1) The use of bmap to test whether the backing fs contains a cache block.
     This is not reliable in a modern extent-based filesystem as it can insert
     and remove bridging blocks of zeros at will.

     Having discussed this with Christoph Hellwig and Dave Chinner, I think I
     that the cache really needs to keep track of this for itself.

 (2) The use of pagecache waitlist snooping to find out if a backing
     filesystem page has been updated yet.  I have the feeling that this is
     not 100% reliable from untrackdownable bugs that seem to relate to this.

     I really would rather be told directly by the backing fs that the op was
     complete.  Switching over to kiocbs means that can be done.

 (3) Having to go through the pagecache attached to the backing file, copying
     data from it or using vfs_write() to write into it.  This doubles the
     amount of pagecache required and adds a bunch of copies for good measure.

     When I wrote the cachefiles caching backend, using direct I/O from within
     the kernel wasn't possible - but, now that kiocbs are available, I can
     actually do async DIO from the backing files to/from the netfs pages,
     cutting out copies in both direction, and using the kiocb completion
     function to tell me when it's done.

 (4) fscache's structs have a number of pointers back into the netfs, which
     makes it tricky if the netfs instance goes away whilst the cache is
     active.

     I really want no pointers back - apart from very transient I/O completion
     callbacks.  I can store the metadata I need in the cookie.

Modernising this affords the opportunity to make huge simplifications in the
code (shaving off over 1000 lines, maybe as many as 3000).

One thing I've done is to make a helper library that handles a number of
features on behalf of a netfs if it wants to use the library:

 (*) Local caching.

 (*) Segmentation and shaping of read operations.

     This takes a ->readahead() request from the VM and translates it into one
     or more reads against the cache and the netfs, allowing both to
     adjust/expand the size of the individual subops according to internal
     alignments.

     Allowing the cache to expand a read request to put it on a larger
     granularity allows the cache to use less metadata to represent what it
     contains.

     It also provides a place to retry operations (something that's required
     if a read against the cache fails and we need to send it to the server
     instead).

 (*) Transparent huge pages (Willy).

 (*) A place to put fscrypt support (Jeff).

We have the first three working - with some limitations - for afs, nfs and
ceph, and I've produced partial patches for 9p and cifs. afs, nfs and ceph are
able to handle xfstests with a cache now - which is something that the old
fscache code will just explode with.


So, as stated, much of that code is written and working.  However, if I do a
complete replacement all the way out to userspace, there are further changes
I'm thinking of making:

 (*) Get rid of the ability to remove a cache that's in use.  This accounts
     for a *lot* of the complexity in fscache.  All the synchronisation
     required to effect the removal of a live cache at any time whilst it's
     actually being used.

 (*) Change cachefiles so that it uses an index file and a single data file
     and perform culling by marking the index rather than deleting data files.
     Culling would then be moved into the kernel.  cachefilesd is then
     unnecessary, except to load the config and keep the cache open.

     Moving the culling into an index would also make manual invalidation
     easier.

 (*) Rather than using cachefilesd to hold the cache open, do something akin
     to swapon/swapoff to add and remove the cache.
     
     Attempting to remove an in-use cache would either fail EBUSY or mark the
     cache to be removed when it becomes unused and not allow further new
     users.

 (*) Declare the size of the cache up front rather than declaring that it has
     to maintain a certain amount of free space, reducing the cache to make
     more space if the level drops.

 (*) Merge cachefiles into fscache.  Give up the ability to have alternate
     cache backends.  That would allow a bit more reduction in the complexity
     and reduce the number of function pointers gone through.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

