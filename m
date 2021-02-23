Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id B36AC323AE3
	for <lists+linux-cachefs@lfdr.de>; Wed, 24 Feb 2021 11:56:26 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-jQty_uzTNzWm3zKajYOtCw-1; Wed, 24 Feb 2021 05:56:23 -0500
X-MC-Unique: jQty_uzTNzWm3zKajYOtCw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 919A7107ACE3;
	Wed, 24 Feb 2021 10:56:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A3DD5D9D3;
	Wed, 24 Feb 2021 10:56:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4CEA558074;
	Wed, 24 Feb 2021 10:56:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11NKSga0030568 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 23 Feb 2021 15:28:42 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7C446112CA16; Tue, 23 Feb 2021 20:28:42 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 78079112CA0E
	for <linux-cachefs@redhat.com>; Tue, 23 Feb 2021 20:28:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8B87C858294
	for <linux-cachefs@redhat.com>; Tue, 23 Feb 2021 20:28:28 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-404-qrOefkY5OW6LHabINnUTuQ-1; Tue, 23 Feb 2021 15:28:26 -0500
X-MC-Unique: qrOefkY5OW6LHabINnUTuQ-1
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lEeHW-008TA8-Qu; Tue, 23 Feb 2021 20:27:48 +0000
Date: Tue, 23 Feb 2021 20:27:42 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Steve French <smfrench@gmail.com>
Message-ID: <20210223202742.GM2858050@casper.infradead.org>
References: <161340385320.1303470.2392622971006879777.stgit@warthog.procyon.org.uk>
	<9e49f96cd80eaf9c8ed267a7fbbcb4c6467ee790.camel@redhat.com>
	<CAH2r5mvPLivjuE=cbijzGSHOvx-hkWSWbcxpoBnJX-BR9pBskQ@mail.gmail.com>
	<20210216021015.GH2858050@casper.infradead.org>
	<CAH2r5mv+AdiODH1TSL+SOQ5qpZ25n7Ysrp+iYxauX9sD8ehhVQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAH2r5mv+AdiODH1TSL+SOQ5qpZ25n7Ysrp+iYxauX9sD8ehhVQ@mail.gmail.com>
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
X-Mailman-Approved-At: Wed, 24 Feb 2021 05:56:13 -0500
Cc: Dominique Martinet <asmadeus@codewreck.org>, Chao Yu <yuchao0@huawei.com>,
	William Kucharski <william.kucharski@oracle.com>,
	linux-afs@lists.infradead.org, CIFS <linux-cifs@vger.kernel.org>,
	Christoph Hellwig <hch@lst.de>, linux-cachefs@redhat.com,
	Trond Myklebust <trondmy@hammerspace.com>,
	v9fs-developer@lists.sourceforge.net,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
	linux-nfs <linux-nfs@vger.kernel.org>, linux-mm <linux-mm@kvack.org>,
	LKML <linux-kernel@vger.kernel.org>,
	linux-f2fs-devel@lists.sourceforge.net, Steve French <sfrench@samba.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH 00/33] Network fs helper library &
 fscache kiocb API [ver #3]
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
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Feb 15, 2021 at 11:22:20PM -0600, Steve French wrote:
> On Mon, Feb 15, 2021 at 8:10 PM Matthew Wilcox <willy@infradead.org> wrote:
> > The switch from readpages to readahead does help in a couple of corner
> > cases.  For example, if you have two processes reading the same file at
> > the same time, one will now block on the other (due to the page lock)
> > rather than submitting a mess of overlapping and partial reads.
> 
> Do you have a simple repro example of this we could try (fio, dbench, iozone
> etc) to get some objective perf data?

I don't.  The problem was noted by the f2fs people, so maybe they have a
reproducer.

> My biggest worry is making sure that the switch to netfs doesn't degrade
> performance (which might be a low bar now since current network file copy
> perf seems to signifcantly lag at least Windows), and in some easy to understand
> scenarios want to make sure it actually helps perf.

I had a question about that ... you've mentioned having 4x4MB reads
outstanding as being the way to get optimum performance.  Is there a
significant performance difference between 4x4MB, 16x1MB and 64x256kB?
I'm concerned about having "too large" an I/O on the wire at a given time.
For example, with a 1Gbps link, you get 250MB/s.  That's a minimum
latency of 16us for a 4kB page, but 16ms for a 4MB page.

"For very simple tasks, people can perceive latencies down to 2 ms or less"
(https://danluu.com/input-lag/)
so going all the way to 4MB I/Os takes us into the perceptible latency
range, whereas a 256kB I/O is only 1ms.

So could you do some experiments with fio doing direct I/O to see if
it takes significantly longer to do, say, 1TB of I/O in 4MB chunks vs
256kB chunks?  Obviously use threads to keep lots of I/Os outstanding.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

