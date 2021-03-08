Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7B506331A1B
	for <lists+linux-cachefs@lfdr.de>; Mon,  8 Mar 2021 23:19:33 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-88-fEeoefeVOfSndLn4_vtrcA-1; Mon, 08 Mar 2021 17:19:30 -0500
X-MC-Unique: fEeoefeVOfSndLn4_vtrcA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19276101F00E;
	Mon,  8 Mar 2021 22:19:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 72AAB60C04;
	Mon,  8 Mar 2021 22:19:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 603854EA32;
	Mon,  8 Mar 2021 22:19:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 128MJHVc023234 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 8 Mar 2021 17:19:17 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5A53030B85; Mon,  8 Mar 2021 22:19:17 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 550B93087F
	for <linux-cachefs@redhat.com>; Mon,  8 Mar 2021 22:19:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1DBEC800B33
	for <linux-cachefs@redhat.com>; Mon,  8 Mar 2021 22:19:15 +0000 (UTC)
Received: from mail104.syd.optusnet.com.au (mail104.syd.optusnet.com.au
	[211.29.132.246]) by relay.mimecast.com with ESMTP id
	us-mta-321-P6V46YVhOSi6PYqClpsWFQ-1; Mon, 08 Mar 2021 17:19:11 -0500
X-MC-Unique: P6V46YVhOSi6PYqClpsWFQ-1
Received: from dread.disaster.area (pa49-181-239-12.pa.nsw.optusnet.com.au
	[49.181.239.12])
	by mail104.syd.optusnet.com.au (Postfix) with ESMTPS id 29E148289A3;
	Tue,  9 Mar 2021 08:55:36 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
	(envelope-from <david@fromorbit.com>)
	id 1lJNqh-000HG4-6L; Tue, 09 Mar 2021 08:55:35 +1100
Date: Tue, 9 Mar 2021 08:55:35 +1100
From: Dave Chinner <david@fromorbit.com>
To: David Howells <dhowells@redhat.com>
Message-ID: <20210308215535.GA63242@dread.disaster.area>
References: <CAOQ4uxhxwKHLT559f8v5aFTheKgPUndzGufg0E58rkEqa9oQ3Q@mail.gmail.com>
	<2653261.1614813611@warthog.procyon.org.uk>
	<517184.1615194835@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <517184.1615194835@warthog.procyon.org.uk>
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=YKPhNiOx c=1 sm=1 tr=0 cx=a_idp_d
	a=gO82wUwQTSpaJfP49aMSow==:117 a=gO82wUwQTSpaJfP49aMSow==:17
	a=kj9zAlcOel0A:10 a=dESyimp9J3IA:10 a=pGLkceISAAAA:8 a=7-415B0cAAAA:8
	a=tj5_YPy7viIAn9pg2yAA:9 a=CjuIK1q_8ugA:10 a=biEYGPWJfzWAr4FL6Ov7:22
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-cachefs@redhat.com
Cc: Christoph Hellwig <hch@infradead.org>,
	Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
	CIFS <linux-cifs@vger.kernel.org>, Amir Goldstein <amir73il@gmail.com>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	"J. Bruce Fields" <bfields@fieldses.org>,
	Miklos Szeredi <miklos@szeredi.hu>, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Mar 08, 2021 at 09:13:55AM +0000, David Howells wrote:
> Amir Goldstein <amir73il@gmail.com> wrote:
> 
> > >  (0a) As (0) but using SEEK_DATA/SEEK_HOLE instead of bmap and opening the
> > >       file for every whole operation (which may combine reads and writes).
> > 
> > I read that NFSv4 supports hole punching, so when using ->bmap() or SEEK_DATA
> > to keep track of present data, it's hard to distinguish between an
> > invalid cached range and a valid "cached hole".
> 
> I wasn't exactly intending to permit caching over NFS.  That leads to fun
> making sure that the superblock you're caching isn't the one that has the
> cache in it.
> 
> However, we will need to handle hole-punching being done on a cached netfs,
> even if that's just to completely invalidate the cache for that file.
> 
> > With ->fiemap() you can at least make the distinction between a non existing
> > and an UNWRITTEN extent.
> 
> I can't use that for XFS, Ext4 or btrfs, I suspect.  Christoph and Dave's
> assertion is that the cache can't rely on the backing filesystem's metadata
> because these can arbitrarily insert or remove blocks of zeros to bridge or
> split extents.

Well, that's not the big problem. The issue that makes FIEMAP
unusable for determining if there is user data present in a file is
that on-disk extent maps aren't exactly coherent with in-memory user
data state.

That is, we can have a hole on disk with delalloc user data in
memory.  There's user data in the file, just not on disk. Same goes
for unwritten extents - there can be dirty data in memory over an
unwritten extent, and it won't get converted to written until the
data is written back and the filesystem runs a conversion
transaction.

So, yeah, if you use FIEMAP to determine where data lies in a file
that is being actively modified, you're going get corrupt data
sooner rather than later.  SEEK_HOLE/DATA are coherent with in
memory user data, so don't have this problem.

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

