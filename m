Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 24B033E1E7E
	for <lists+linux-cachefs@lfdr.de>; Fri,  6 Aug 2021 00:14:11 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-eXPjoyr4PySWAIfe0miuRA-1; Thu, 05 Aug 2021 18:14:09 -0400
X-MC-Unique: eXPjoyr4PySWAIfe0miuRA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BFDDD1853029;
	Thu,  5 Aug 2021 22:14:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 87BDA105958D;
	Thu,  5 Aug 2021 22:14:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9ABA34BB7C;
	Thu,  5 Aug 2021 22:14:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 175MBYY9004149 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 5 Aug 2021 18:11:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C57A610439B7; Thu,  5 Aug 2021 22:11:34 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C191D105457E
	for <linux-cachefs@redhat.com>; Thu,  5 Aug 2021 22:11:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 52A42101A529
	for <linux-cachefs@redhat.com>; Thu,  5 Aug 2021 22:11:32 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-250-nbowvAvVOlKCtosvSc_IOA-1; Thu, 05 Aug 2021 18:11:28 -0400
X-MC-Unique: nbowvAvVOlKCtosvSc_IOA-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
	Hat Linux)) id 1mBla0-007ZDJ-Ph; Thu, 05 Aug 2021 22:11:12 +0000
Date: Thu, 5 Aug 2021 23:11:08 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <YQxh/G0xGl3GtC8y@casper.infradead.org>
References: <YQv+iwmhhZJ+/ndc@casper.infradead.org>
	<YQvpDP/tdkG4MMGs@casper.infradead.org>
	<YQvbiCubotHz6cN7@casper.infradead.org>
	<1017390.1628158757@warthog.procyon.org.uk>
	<1170464.1628168823@warthog.procyon.org.uk>
	<1186271.1628174281@warthog.procyon.org.uk>
	<1219713.1628181333@warthog.procyon.org.uk>
	<CAHk-=wjyEk9EuYgE3nBnRCRd_AmRYVOGACEjt0X33QnORd5-ig@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHk-=wjyEk9EuYgE3nBnRCRd_AmRYVOGACEjt0X33QnORd5-ig@mail.gmail.com>
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
Cc: Shyam Prasad N <nspmangalore@gmail.com>, Steve French <sfrench@samba.org>,
	"open list:NFS, SUNRPC, AND..." <linux-nfs@vger.kernel.org>,
	linux-afs@lists.infradead.org, Miklos Szeredi <miklos@szeredi.hu>,
	CIFS <linux-cifs@vger.kernel.org>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Linux-MM <linux-mm@kvack.org>, linux-cachefs@redhat.com,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Anna Schumaker <anna.schumaker@netapp.com>,
	devel@lists.orangefs.org, Mike Marshall <hubcap@omnibond.com>
Subject: Re: [Linux-cachefs] Canvassing for network filesystem write size vs
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Aug 05, 2021 at 10:27:05AM -0700, Linus Torvalds wrote:
> On Thu, Aug 5, 2021 at 9:36 AM David Howells <dhowells@redhat.com> wrote:
> > Some network filesystems, however, currently keep track of which byte ranges
> > are modified within a dirty page (AFS does; NFS seems to also) and only write
> > out the modified data.
> 
> NFS definitely does. I haven't used NFS in two decades, but I worked
> on some of the code (read: I made nfs use the page cache both for
> reading and writing) back in my Transmeta days, because NFSv2 was the
> default filesystem setup back then.
> 
> See fs/nfs/write.c, although I have to admit that I don't recognize
> that code any more.
> 
> It's fairly important to be able to do streaming writes without having
> to read the old contents for some loads. And read-modify-write cycles
> are death for performance, so you really want to coalesce writes until
> you have the whole page.

I completely agree with you.  The context you're missing is that Dave
wants to do RMW twice.  He doesn't do the delaying SetPageUptodate dance.
If the write is less than the whole page, AFS, Ceph and anybody else
using netfs_write_begin() will first read the entire page in and mark
it Uptodate.

Then he wants to track which parts of the page are dirty (at byte
granularity) and send only those bytes to the server in a write request.
So it's worst of both worlds; first the client does an RMW, then the
server does an RMW (assuming the client's data is no longer in the
server's cache.

The NFS code moves the RMW from the client to the server, and that makes
a load of sense.

> That said, I suspect it's also *very* filesystem-specific, to the
> point where it might not be worth trying to do in some generic manner.

It certainly doesn't make sense for block filesystems.  Since they
can only do I/O on block boundaries, a sub-block write has to read in
the surrounding block, and once you're doing that, you might as well
read in the whole page.

Tracking sub-page dirty bits still makes sense.  It's on my to-do
list for iomap.

> [ goes off and looks. See "nfs_write_begin()" and friends in
> fs/nfs/file.c for some of the examples of these things, althjough it
> looks like the code is less aggressive about avoding the
> read-modify-write case than I thought I remembered, and only does it
> for write-only opens ]

NFS is missing one trick; it could implement aops->is_partially_uptodate
and then it would be able to read back bytes that have already been
written by this client without writing back the dirty ranges and fetching
the page from the server.

Maybe this isn't an important optimisation.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

