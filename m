Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id B945532BF2E
	for <lists+linux-cachefs@lfdr.de>; Thu,  4 Mar 2021 00:20:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614813631;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dVvDI2YEMtrEweb40dc+9Q+FA1WcMT40+hLdDGq/2Jw=;
	b=Md6WLpjyQ3qqzBd+KtLxwqHPGG/AHOYBB6cdutGHWvhErvMTNSdrKo7QkWDYBQtqWBThy0
	ztGw9Hn37/ULV3L4TUdzjwhmh5d7u0vqi4DtSzCumBec/c2p8F2DpGOGwMYjqLfdGjQN4+
	GPVuwd62t+6pqtz2RwHxZpBswOedrwU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-cXZuwQo1MLe19GfBW9xEtg-1; Wed, 03 Mar 2021 18:20:29 -0500
X-MC-Unique: cXZuwQo1MLe19GfBW9xEtg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 138C21083E90;
	Wed,  3 Mar 2021 23:20:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D03665D9C2;
	Wed,  3 Mar 2021 23:20:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EF2DE50033;
	Wed,  3 Mar 2021 23:20:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 123NKIlA001603 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 3 Mar 2021 18:20:18 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id ED4A16F45C; Wed,  3 Mar 2021 23:20:18 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-119-68.rdu2.redhat.com
	[10.10.119.68])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E6AC612D7E;
	Wed,  3 Mar 2021 23:20:12 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
MIME-Version: 1.0
Date: Wed, 03 Mar 2021 23:20:11 +0000
Message-ID: <2653261.1614813611@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-cachefs@redhat.com
Cc: "J. Bruce Fields" <bfields@fieldses.org>, linux-nfs@vger.kernel.org,
	Christoph Hellwig <hch@infradead.org>,
	linux-cifs@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Dave Chinner <dchinner@redhat.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	linux-afs@lists.infradead.org
Subject: [Linux-cachefs] fscache: Redesigning the on-disk cache
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
Content-ID: <2653260.1614813611.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

I'm looking at redesigning the on-disk cache format used by fscache's
cachefiles driver to try and eliminate the number of synchronous metadata
operations done by the driver, to improve culling performance and to reduce
the amount of opens/files open.  I also need to stop relying on the backing
filesystem to track where I have data stored.

There are a number of options that I've considered:

 (0) The current format lays out a directory tree, with directories for each
     level of index (so in AFS's terms, you've got an overall "afs" dir
     containing a dir for each cell.  In each cell dir, there's a dir for each
     volume and within that there's a file for each afs vnode cached.  Extra
     levels of directory are also interposed to reduce the number of entries
     in a directory.

     - Pathwalk cost to open a cache file.
     - Netfs coherency data is in xattrs.
     - Invalidation done by truncate or unlink.
     - Uses backing filesystem metadata to keep track of present data.
       - Determined by bmap() on the cache file.
     - Culling performed by userspace daemon.
     - Data file opened for every write.
     - Read done by readpage without file.

 (0a) As (0) but using SEEK_DATA/SEEK_HOLE instead of bmap and opening the
      file for every whole operation (which may combine reads and writes).

 (1) Structured the same as (0), but keeping an independent content map and
     not relying on backing fs metadata.  Use a larger blocksize, say 256K, to
     reduce the size of the content map.

     - Netfs coherency data in xattrs.
     - Invalidation done by tmpfile creation and link-replace.
     - Content bitmap kept in xattr.
       - Limited capacity.  Could use multiple bitmaps.
       - Can skip the bitmap for a non-sparse file that we have all of.
     - "Open" state kept in xattr.
     - File is kept open
     - Culling performed by userspace daemon.
     - Cache file open whilst netfs file is open.

 (2) Structured the same as (1), but keeping an extent list instead of a
     bitmap.

     - Content extent map kept in xattr.
       - Limited capacity.
       - Highly scattered extents use a lot of map space.

 (3) OpenAFS-style format.  One index file to look up {file_key,block#} and an
     array of data files, each holding one block (e.g. a 256KiB-aligned chunk
     of a file).  Each index entry has valid start/end offsets for easy
     truncation.

     The index has a hash to facilitate the lookup and an LRU that allows a
     block to be recycled at any time.

     - File keys, are highly variable in length and can be rather long,
       particularly NFS FIDs.
       - Might want a separate file index that maps file keys to a slot ID
       	 that can then be used in the block index.
     - Netfs coherency data in vnode index entry.
     - Invalidation done by clearing matching entries in the index.
       - Dead data files can be lazily unlinked or truncated or just
         overwritten.
     - Content mapping by lookup in block index hash table.
       - Fine if the hash table is large and scatter is good.
     - Potential coherency problem between indices and data file.
     - Culling performed by block index LRU.
     - Really want to retain entire block index in RAM.
     - Data files are opened for every read/write.

 (4) Similar format to (3), but could put entirety of data in one file.

     - Data file open entire time cache online.
     - Unused block bitmap.
     - Can use fallocate to punch out dead blocks.
     - Could put data file on blockdev.

 (5) Similar idea to (4), but just have a file index and use block pointers
     and indirection blocks instead.  Use an LRU in the file index and cull
     whole files only, not individual blocks.

     - File keys, are highly variable in length and can be rather long,
       particularly NFS FIDs.
     - Netfs coherency data in vnode index entry.
     - Unused data block bitmap.
     - Invalidation done by clearing entries in the file index.
       - Data blocks must be recycled and returned to bitmap.
       - Dead data blocks can be lazily punched out with fallocate.
     - Potential coherency problem between index, pointers/indirection and
       bitmap.
     - Culling performed by file index LRU.
     - Really want to retain entire file index and block bitmap in RAM.
       - May be less memory than block index.
     - Data file open entire time cache online.
     - Could put data file on blockdev.
     - If the block size is large, lots of dead space in indirection blocks.

 (6) Similar to (5), but use extent lists rather than indirection blocks.

     - Requires allocation of contiguous space to be worthwhile.
     - Buddy allocator approach?
       - Can always arbitrarily recycle buddies to make larger spaces - if we
       	 can find them...

 (7) Hybrid approach.  Stick the first block of every netfs file in one big
     cache file.  For a lot of cases, that would suffice for the entire file
     if the block size is large enough.  Store the tails of larger files in
     separate files.

     - File index with LRU.
     - More complicated to manage.
     - Fewer files open.

So (0) is what's upstream.  I have (0a) implemented in my fscache-netfs-lib
branch and (1) implemented in my fscache-iter branch.  However, it spends a
lot of cpu time doing synchronous metadata ops, such as creating tmpfiles,
link creation and setting xattrs, particularly when unmounting the filesystem
or disabling the cache - both of which are done during shutdown.

I'm leaning towards (4) or (5).  I could use extent maps, but I don't
necessarily have a good idea of what access patterns I have to deal with till
later.  With network filesystems that are going to read and cache large blocks
(say 2MiB), extents would allow reduction of the metadata, particularly where
it would span a bitmap.

Using a block index (4) allows me to easily recycle a large chunk of cache in
one go - even if it means arbitrarily kicking out blocks that weren't near the
end of the LRU yet.

Using block pointers and indirection blocks (5) means I only need this data in
RAM when I need it; with the LRU management being done in the file index.

Either way with (4) and (5), at least one index really needs to be resident in
RAM to make LRU wangling efficient.  Also, I need to decide how to handle
coherency management - setting an "in use" flag on the file index entry and
flushing it before making any modifications might work.

On the other hand, sticking with (1) or (2) makes it easier to add extra
metadata very easily (say to handle disconnected operation), though it's
harder to manage culling and manage the capacity of the cache.

I have a suspicion that the answer is "it depends" and that the best choice is
very much going to be workload dependent - and may even vary from volume to
volume within the same workload.

Any thoughts or better solutions?

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

