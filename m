Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id C1CCE330A0A
	for <lists+linux-cachefs@lfdr.de>; Mon,  8 Mar 2021 10:14:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1615194856;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=oATTIQJjLST2Ab0OspIu2o8zrtWz4M+9OO5Eja/3NU0=;
	b=TAzHiXYIbjlpYLWzO9kduRr172fspCkChl0fj4KSdjbrXy846Xdej7ml328/KNei5dBgGM
	PdmC0xgB8bUyA/d3OJb0rHkKTRuc7srJ1bFLAkQkXRWvjF3T8fJ2rf0XqBvN/tQGO4nXUn
	mlvzSWDgSugE/FnxXit9F2sZKWXMcCk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-RYZgp7wNNz62p48IJjklog-1; Mon, 08 Mar 2021 04:14:15 -0500
X-MC-Unique: RYZgp7wNNz62p48IJjklog-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED7E81005D4A;
	Mon,  8 Mar 2021 09:14:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 434795D9CD;
	Mon,  8 Mar 2021 09:14:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 566561809C86;
	Mon,  8 Mar 2021 09:14:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1289E3IO003730 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 8 Mar 2021 04:14:03 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 91FD061F2B; Mon,  8 Mar 2021 09:14:03 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-79.rdu2.redhat.com
	[10.10.112.79])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AE6B36267B;
	Mon,  8 Mar 2021 09:13:56 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CAOQ4uxhxwKHLT559f8v5aFTheKgPUndzGufg0E58rkEqa9oQ3Q@mail.gmail.com>
References: <CAOQ4uxhxwKHLT559f8v5aFTheKgPUndzGufg0E58rkEqa9oQ3Q@mail.gmail.com>
	<2653261.1614813611@warthog.procyon.org.uk>
To: Amir Goldstein <amir73il@gmail.com>
MIME-Version: 1.0
Date: Mon, 08 Mar 2021 09:13:55 +0000
Message-ID: <517184.1615194835@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 1289E3IO003730
X-loop: linux-cachefs@redhat.com
Cc: "J. Bruce Fields" <bfields@fieldses.org>,
	Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
	Christoph Hellwig <hch@infradead.org>, CIFS <linux-cifs@vger.kernel.org>,
	Miklos Szeredi <miklos@szeredi.hu>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-cachefs@redhat.com, Alexander Viro <viro@zeniv.linux.org.uk>,
	Dave Chinner <dchinner@redhat.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	v9fs-developer@lists.sourceforge.net,
	ceph-devel <ceph-devel@vger.kernel.org>, linux-afs@lists.infradead.org
Subject: Re: [Linux-cachefs] fscache: Redesigning the on-disk cache
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <517183.1615194835.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Amir Goldstein <amir73il@gmail.com> wrote:

> >  (0a) As (0) but using SEEK_DATA/SEEK_HOLE instead of bmap and opening the
> >       file for every whole operation (which may combine reads and writes).
> 
> I read that NFSv4 supports hole punching, so when using ->bmap() or SEEK_DATA
> to keep track of present data, it's hard to distinguish between an
> invalid cached range and a valid "cached hole".

I wasn't exactly intending to permit caching over NFS.  That leads to fun
making sure that the superblock you're caching isn't the one that has the
cache in it.

However, we will need to handle hole-punching being done on a cached netfs,
even if that's just to completely invalidate the cache for that file.

> With ->fiemap() you can at least make the distinction between a non existing
> and an UNWRITTEN extent.

I can't use that for XFS, Ext4 or btrfs, I suspect.  Christoph and Dave's
assertion is that the cache can't rely on the backing filesystem's metadata
because these can arbitrarily insert or remove blocks of zeros to bridge or
split extents.

> You didn't say much about crash consistency or durability requirements of the
> cache. Since cachefiles only syncs the cache on shutdown, I guess you
> rely on the hosting filesystem to provide the required ordering guarantees.

There's an xattr on each file in the cache to record the state.  I use this
mark a cache file "open".  If, when I look up a file, the file is marked open,
it is just discarded at the moment.

Now, there are two types of data stored in the cache: data that has to be
stored as a single complete blob and is replaced as such (e.g. symlinks and
AFS dirs) and data that might be randomly modified (e.g. regular files).

For the former, I have code, though in yet another branch, that writes this in
a tmpfile, sets the xattrs and then uses vfs_link(LINK_REPLACE) to cut over.

For the latter, that's harder to do as it would require copying the data to
the tmpfile before we're allowed to modify it.  However, if it's possible to
create a tmpfile that's a CoW version of a data file, I could go down that
route.

But after I've written and sync'd the data, I set the xattr to mark the file
not open.  At the moment I'm doing this too lazily, only doing it when a netfs
file gets evicted or when the cache gets withdrawn, but I really need to add a
queue of objects to be sealed as they're closed.  The balance is working out
how often to do the sealing as something like a shell script can do a lot of
consecutive open/write/close ops.

> How does this work with write through network fs cache if the client system
> crashes but the write gets to the server?

The presumption is that the coherency info on the server will change, but
won't get updated in the cache.

> Client system get restart with older cached data because disk caches were
> not flushed before crash. Correct?  Is that case handled? Are the caches
> invalidated on unclean shutdown?

The netfs provides some coherency info for the cache to store.  For AFS, for
example, this is the data version number (though it should probably include
the volume creation time too).  This is stored with the state info in the same
xattr and is only updated when the "open" state is cleared.

When the cache file is reopened, if the coherency info doesn't match what
we're expecting (presumably we queried the server), the file is discarded.

(Note that the coherency info is netfs-specific)

> Anyway, how are those ordering requirements going to be handled when entire
> indexing is in a file? You'd practically need to re-implement a filesystem

Yes, the though has occurred to me too.  I would be implementing a "simple"
filesystem - and we have lots of those:-/.  The most obvious solution is to
use the backing filesystem's metadata - except that that's not possible.

> journal or only write cache updates to a temp file that can be discarded at
> any time?

It might involve keeping a bitmap of "open" blocks.  Those blocks get
invalidated when the cache restarts.  The simplest solution would be to wipe
the entire cache in such a situation, but that goes against one of the
important features I want out of it.

Actually, a journal of open and closed blocks might be better, though all I
really need to store for each block is a 32-bit number.

It's a particular problem if I'm doing DIO to the data storage area but
buffering the changes to the metadata.  Further, the metadata and data might
be on different media, just to add to the complexity.

Another possibility is only to cull blocks when the parent file is culled.
That probably makes more sense as, as long as the file is registered culled on
disk first and I don't reuse the file slot too quickly, I can write to the
data store before updating the metadata.

> If you come up with a useful generic implementation of a "file data
> overlay", overlayfs could also use it for "partial copy up" as well as for
> implementation of address space operations, so please keep that in mind.

I'm trying to implement things so that the netfs does look-aside when reading,
and multi-destination write-back when writing - but the netfs is in the
driving seat and the cache is invisible to the user.  I really want to avoid
overlaying the cache on the netfs so that the cache is the primary access
point.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

