Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 736853E2C5C
	for <lists+linux-cachefs@lfdr.de>; Fri,  6 Aug 2021 16:18:23 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503-e-THzmdqNIGrT7SFXybY4w-1; Fri, 06 Aug 2021 10:18:21 -0400
X-MC-Unique: e-THzmdqNIGrT7SFXybY4w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 16AA11937FC4;
	Fri,  6 Aug 2021 14:18:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0936A60CA1;
	Fri,  6 Aug 2021 14:18:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 556A8180BAB1;
	Fri,  6 Aug 2021 14:18:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 176EIDOV010328 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 6 Aug 2021 10:18:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B59A720FE6DE; Fri,  6 Aug 2021 14:18:13 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B137520FE6DC
	for <linux-cachefs@redhat.com>; Fri,  6 Aug 2021 14:18:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0E50E185A794
	for <linux-cachefs@redhat.com>; Fri,  6 Aug 2021 14:18:11 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-586-pOynFvZQM8iL4ga7tiSKBw-1; Fri, 06 Aug 2021 10:18:07 -0400
X-MC-Unique: pOynFvZQM8iL4ga7tiSKBw-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
	Hat Linux)) id 1mC0fT-008GBJ-Rm; Fri, 06 Aug 2021 14:17:55 +0000
Date: Fri, 6 Aug 2021 15:17:47 +0100
From: Matthew Wilcox <willy@infradead.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <YQ1Ei9lv9ov2AheS@casper.infradead.org>
References: <YQxh/G0xGl3GtC8y@casper.infradead.org>
	<YQv+iwmhhZJ+/ndc@casper.infradead.org>
	<YQvpDP/tdkG4MMGs@casper.infradead.org>
	<YQvbiCubotHz6cN7@casper.infradead.org>
	<1017390.1628158757@warthog.procyon.org.uk>
	<1170464.1628168823@warthog.procyon.org.uk>
	<1186271.1628174281@warthog.procyon.org.uk>
	<1219713.1628181333@warthog.procyon.org.uk>
	<CAHk-=wjyEk9EuYgE3nBnRCRd_AmRYVOGACEjt0X33QnORd5-ig@mail.gmail.com>
	<1302671.1628257357@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <1302671.1628257357@warthog.procyon.org.uk>
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
Cc: Shyam Prasad N <nspmangalore@gmail.com>, CIFS <linux-cifs@vger.kernel.org>,
	"open list:NFS, SUNRPC, AND..." <linux-nfs@vger.kernel.org>,
	linux-afs@lists.infradead.org, Miklos Szeredi <miklos@szeredi.hu>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Steve French <sfrench@samba.org>, Linux-MM <linux-mm@kvack.org>,
	linux-cachefs@redhat.com, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Aug 06, 2021 at 02:42:37PM +0100, David Howells wrote:
> Matthew Wilcox <willy@infradead.org> wrote:
> 
> > > It's fairly important to be able to do streaming writes without having
> > > to read the old contents for some loads. And read-modify-write cycles
> > > are death for performance, so you really want to coalesce writes until
> > > you have the whole page.
> > 
> > I completely agree with you.  The context you're missing is that Dave
> > wants to do RMW twice.  He doesn't do the delaying SetPageUptodate dance.
> 
> Actually, I do the delaying of SetPageUptodate in the new write helpers that
> I'm working on - at least to some extent.  For a write of any particular size
> (which may be more than a page), I only read the first and last pages affected
> if they're not completely changed by the write.  Note that I have my own
> version of generic_perform_write() that allows me to eliminate write_begin and
> write_end for any filesystem using it.

No, that is very much not the same thing.  Look at what NFS does, like
Linus said.  Consider this test program:

	fd = open();
	lseek(fd, 5, SEEK_SET);
	write(fd, buf, 3);
	write(fd, buf2, 10);
	write(fd, buf3, 2);
	close(fd);

You're going to do an RMW.  NFS keeps track of which bytes are dirty,
and writes only those bytes to the server (when that page is eventually
written-back).  So yes, it's using the page cache, but it's not doing
an unnecessary read from the server.

> It has occurred to me that I don't actually need the pages to be uptodate and
> completely filled out.  I'm tracking which bits are dirty - I could defer
> reading the missing bits till someone wants to read or mmap.
> 
> But that kind of screws with local caching.  The local cache might need to
> track the missing bits, and we are likely to be using blocks larger than a
> page.

There's nothing to cache.  Pages which are !Uptodate aren't going to get
locally cached.

> Basically, there are a lot of scenarios where not having fully populated pages
> sucks.  And for streaming writes, wouldn't it be better if you used DIO
> writes?

DIO can't do sub-512-byte writes.

> > If the write is less than the whole page, AFS, Ceph and anybody else
> > using netfs_write_begin() will first read the entire page in and mark
> > it Uptodate.
> 
> Indeed - but that function is set to be replaced.  What you're missing is that
> if someone then tries to read the partially modified page, you may have to do
> two reads from the server.

NFS doesn't.  It writes back the dirty data from the page and then
does a single read of the entire page.  And as I said later on, using
->is_partially_uptodate can avoid that for some cases.

> > Then he wants to track which parts of the page are dirty (at byte
> > granularity) and send only those bytes to the server in a write request.
> 
> Yes.  Because other constraints may apply, for example the handling of
> conflicting third-party writes.  The question here is how much we care about
> that - and that's why I'm trying to write back only what's changed where
> possible.

If you care about conflicting writes from different clients, you really
need to establish a cache ownership model.  Or treat the page-cache as
write-through.

> > > That said, I suspect it's also *very* filesystem-specific, to the
> > > point where it might not be worth trying to do in some generic manner.
> > 
> > It certainly doesn't make sense for block filesystems.  Since they
> > can only do I/O on block boundaries, a sub-block write has to read in
> > the surrounding block, and once you're doing that, you might as well
> > read in the whole page.
> 
> I'm not trying to do this for block filesystems!  However, a block filesystem
> - or even a blockdev - might be involved in terms of the local cache.

You might not be trying to do anything for block filesystems, but we
should think about what makes sense for block filesystems as well as
network filesystems.

> > Tracking sub-page dirty bits still makes sense.  It's on my to-do
> > list for iomap.
> 
> /me blinks
> 
> "bits" as in parts of a page or "bits" as in the PG_dirty bits on the pages
> contributing to a folio?

Perhaps I should have said "Tracking dirtiness on a sub-page basis".
Right now, that looks like a block bitmap, but maybe it should be a
range-based data structure.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

