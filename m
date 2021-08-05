Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 897823E19A2
	for <lists+linux-cachefs@lfdr.de>; Thu,  5 Aug 2021 18:35:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1628181358;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=RRLLwUroUZvROcGniMtR1NWR5t+he6BQ98oItn0j5Zo=;
	b=eeaeJV7iCbx+BHZsZHLue1DHtxurDwznt2GaSsmrxvCIjwQVF+hbTZrc7vU55eDpbpzuCT
	81dOlNe5kPmtwb8LQrg90q2/uclI26j1hGb3/UdspoTGrMowKyQHKza5d+Z4ulCeSE42i/
	2xbmWZf0taQJHHeIGKnGvvRO0gXUp98=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-540-n85e6gJNONSnWgbh3AR27w-1; Thu, 05 Aug 2021 12:35:52 -0400
X-MC-Unique: n85e6gJNONSnWgbh3AR27w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45E74100E355;
	Thu,  5 Aug 2021 16:35:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2DD84781EA;
	Thu,  5 Aug 2021 16:35:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7D07C4BB7C;
	Thu,  5 Aug 2021 16:35:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 175GZc0P002424 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 5 Aug 2021 12:35:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BFFBC5C25D; Thu,  5 Aug 2021 16:35:38 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.22.32.7])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1A1BA5C1A1;
	Thu,  5 Aug 2021 16:35:33 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: Anna Schumaker <anna.schumaker@netapp.com>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Jeff Layton <jlayton@redhat.com>, Steve French <sfrench@samba.org>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Mike Marshall <hubcap@omnibond.com>, Miklos Szeredi <miklos@szeredi.hu>
References: <YQv+iwmhhZJ+/ndc@casper.infradead.org>
	<YQvpDP/tdkG4MMGs@casper.infradead.org>
	<YQvbiCubotHz6cN7@casper.infradead.org>
	<1017390.1628158757@warthog.procyon.org.uk>
	<1170464.1628168823@warthog.procyon.org.uk>
	<1186271.1628174281@warthog.procyon.org.uk>
MIME-Version: 1.0
Date: Thu, 05 Aug 2021 17:35:33 +0100
Message-ID: <1219713.1628181333@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-cachefs@redhat.com
Cc: Shyam Prasad N <nspmangalore@gmail.com>, linux-cifs@vger.kernel.org,
	linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-mm@kvack.org, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-afs@lists.infradead.org, devel@lists.orangefs.org
Subject: [Linux-cachefs] Canvassing for network filesystem write size vs
	page size
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
Content-ID: <1219712.1628181333.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

With Willy's upcoming folio changes, from a filesystem point of view, we're
going to be looking at folios instead of pages, where:

 - a folio is a contiguous collection of pages;

 - each page in the folio might be standard PAGE_SIZE page (4K or 64K, say) or
   a huge pages (say 2M each);

 - a folio has one dirty flag and one writeback flag that applies to all
   constituent pages;

 - a complete folio currently is limited to PMD_SIZE or order 8, but could
   theoretically go up to about 2GiB before various integer fields have to be
   modified (not to mention the memory allocator).

Willy is arguing that network filesystems should, except in certain very
special situations (eg. O_SYNC), only write whole folios (limited to EOF).

Some network filesystems, however, currently keep track of which byte ranges
are modified within a dirty page (AFS does; NFS seems to also) and only write
out the modified data.

Also, there are limits to the maximum RPC payload sizes, so writing back large
pages may necessitate multiple writes, possibly to multiple servers.

What I'm trying to do is collate each network filesystem's properties (I'm
including FUSE in that).

So we have the following filesystems:

 Plan9
 - Doesn't track bytes
 - Only writes single pages

 AFS
 - Max RPC payload theoretically ~5.5 TiB (OpenAFS), ~16EiB (Auristor/kAFS)
 - kAFS (Linux kernel)
   - Tracks bytes, only writes back what changed
   - Writes from up to 65535 contiguous pages.
 - OpenAFS/Auristor (UNIX/Linux)
   - Deal with cache-sized blocks (configurable, but something from 8K to 2M),
     reads and writes in these blocks
 - OpenAFS/Auristor (Windows)
   - Track bytes, write back only what changed

 Ceph
 - File divided into objects (typically 2MiB in size), which may be scattered
   over multiple servers.
 - Max RPC size is therefore object size.
 - Doesn't track bytes.

 CIFS/SMB
 - Writes back just changed bytes immediately under some circumstances
 - Doesn't track bytes and writes back whole pages otherwise.
 - SMB3 has a max RPC size of 16MiB, with a default of 4MiB

 FUSE
 - Doesn't track bytes.
 - Max 'RPC' size of 256 pages (I think).

 NFS
 - Tracks modified bytes within a page.
 - Max RPC size of 1MiB.
 - Files may be constructed of objects scattered over different servers.

 OrangeFS
 - Doesn't track bytes.
 - Multipage writes possible.

If you could help me fill in the gaps, that would be great.

Thanks,
David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

