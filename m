Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A769436E7C
	for <lists+linux-cachefs@lfdr.de>; Fri, 22 Oct 2021 01:43:49 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532-kREEjBE4Mg2YEgYQvkkeqg-1; Thu, 21 Oct 2021 19:43:45 -0400
X-MC-Unique: kREEjBE4Mg2YEgYQvkkeqg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CEA7362F8;
	Thu, 21 Oct 2021 23:43:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EB1A3652AC;
	Thu, 21 Oct 2021 23:43:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6E54E4A703;
	Thu, 21 Oct 2021 23:43:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19LNhdfc015244 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 21 Oct 2021 19:43:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CA7802166B2D; Thu, 21 Oct 2021 23:43:39 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C5A2B2166B25
	for <linux-cachefs@redhat.com>; Thu, 21 Oct 2021 23:43:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 161401875069
	for <linux-cachefs@redhat.com>; Thu, 21 Oct 2021 23:43:37 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-538-sqCABhsXNSSmrryV_JgFXQ-1;
	Thu, 21 Oct 2021 19:43:35 -0400
X-MC-Unique: sqCABhsXNSSmrryV_JgFXQ-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id D7B706120C;
	Thu, 21 Oct 2021 23:43:31 +0000 (UTC)
Message-ID: <d70b28fb4392ac1aafb1b21d1b8da061be16104c.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Steve French <smfrench@gmail.com>, Omar Sandoval <osandov@osandov.com>
Date: Thu, 21 Oct 2021 19:43:30 -0400
In-Reply-To: <CAH2r5msO7-QCXv6JQj2Tado9ZoWAHRkgq6-En18PeKSXFDdBLw@mail.gmail.com>
References: <163456861570.2614702.14754548462706508617.stgit@warthog.procyon.org.uk>
	<YXHntB2O0ACr0pbz@relinquished.localdomain>
	<CAH2r5msO7-QCXv6JQj2Tado9ZoWAHRkgq6-En18PeKSXFDdBLw@mail.gmail.com>
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-cachefs@redhat.com
Cc: Latchesar Ionkov <lucho@ionkov.net>,
	Dominique Martinet <asmadeus@codewreck.org>, Al,
	linux-mm <linux-mm@kvack.org>, Marc Dionne <marc.dionne@auristor.com>,
	linux-afs@lists.infradead.org, Shyam Prasad N <nspmangalore@gmail.com>,
	CIFS <linux-cifs@vger.kernel.org>, Trond,
	Matthew Wilcox <willy@infradead.org>, linux-cachefs@redhat.com,
	Myklebust <trondmy@hammerspace.com>, v9fs-developer@lists.sourceforge.net,
	Ilya Dryomov <idryomov@gmail.com>,
	Kent Overstreet <kent.overstreet@gmail.com>,
	Viro <viro@zeniv.linux.org.uk>, ceph-devel <ceph-devel@vger.kernel.org>,
	Myklebust <trond.myklebust@hammerspace.com>,
	linux-nfs <linux-nfs@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
	Steve French <sfrench@samba.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH 00/67] fscache: Rewrite index API and
	management system
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 2021-10-21 at 18:15 -0500, Steve French wrote:
> On Thu, Oct 21, 2021 at 5:21 PM Omar Sandoval <osandov@osandov.com> wrote:
> > 
> > On Mon, Oct 18, 2021 at 03:50:15PM +0100, David Howells wrote:
> > However, with the advent of the tmpfile capacity in the VFS, an opportunity
> > arises to do invalidation much more easily, without having to wait for I/O
> > that's actually in progress: Cachefiles can simply cut over its file
> > pointer for the backing object attached to a cookie and abandon the
> > in-progress I/O, dismissing it upon completion.
> 
> Have changes been made to O_TMPFILE?  It is problematic for network filesystems
> because it is not an atomic operation, and would be great if it were possible
> to create a tmpfile and open it atomically (at the file system level).
> 
> Currently it results in creating a tmpfile (which results in
> opencreate then close)
> immediately followed by reopening the tmpfile which is somewhat counter to
> the whole idea of a tmpfile (ie that it is deleted when closed) since
> the syscall results
> in two opens ie open(create)/close/open/close
> 
> 

In this case, O_TMPFILE is being used on the cachefiles backing store,
and that usually isn't deployed on a netfs. That said, Steve does have a
good point...

What happens if you do end up without O_TMPFILE support on the backing
store? Probably just opting to not cache in that case is fine. Does
cachefiles just shut down in that situation?
-- 
Jeff Layton <jlayton@kernel.org>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

