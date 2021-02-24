Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id A6D10323AE4
	for <lists+linux-cachefs@lfdr.de>; Wed, 24 Feb 2021 11:56:34 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-c_W_EOWVN7SdGy6Rse3UJg-1; Wed, 24 Feb 2021 05:56:22 -0500
X-MC-Unique: c_W_EOWVN7SdGy6Rse3UJg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2FD97835E23;
	Wed, 24 Feb 2021 10:56:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EA9D9679F4;
	Wed, 24 Feb 2021 10:56:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7AD1218095CC;
	Wed, 24 Feb 2021 10:56:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11O4w9xm019150 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 23 Feb 2021 23:58:09 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E0E2BFDCCF; Wed, 24 Feb 2021 04:58:08 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D8400FDCF0
	for <linux-cachefs@redhat.com>; Wed, 24 Feb 2021 04:58:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 46D968919C0
	for <linux-cachefs@redhat.com>; Wed, 24 Feb 2021 04:58:06 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
	[209.85.167.49]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-530-EijSih0CN66pZ6Hnpm1scw-1; Tue, 23 Feb 2021 23:58:01 -0500
X-MC-Unique: EijSih0CN66pZ6Hnpm1scw-1
Received: by mail-lf1-f49.google.com with SMTP id m22so1083222lfg.5;
	Tue, 23 Feb 2021 20:58:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=FrajYP2hBjaKUlNDr5nfLO5dI2VEsLYw/fRZTXaD8VA=;
	b=lSVMLy60EOdTZGEilNMrZNAlh5R20RpJlIp7ruZPeY342/Z2/4jBb2k8W5dJuqa2Bc
	BhSwDXGDlHTBkYZv+kMYyGEC+Tcj4SK6jOjxBxgvIaAv5De2eZtw1N7jnXgT7JAAqmzY
	CVSHKsYrDGl9gl8uCdagM6ZoFiwmQ3FDmrHMyxxJHoP7XmP/bCtu5zlfVZ3PlbeP7eMI
	Y4fOp+APnx9QFFQMqW1hNIMbC3di1ch0kIn4IeVhCoEvmQ5VOQfqHbO6iIQCa83IgPlt
	EbvjmTc0Er6pvDs9z7JChTpJzvpzYAnwaJkr0D0Hg/1O+shcmH5xlQENmzJGRW0kE9r/
	Na5w==
X-Gm-Message-State: AOAM533NnxUkSUlyCkUHugF9RzIfLAa8aOgL+aihjVQXdYXCDmSAbR7n
	V0wXo8YE1snrwBQ7iu1sZdH6t5tzXtB0GyFh+44=
X-Google-Smtp-Source: ABdhPJw6r/na/lmIQBVTZHzL3REpx3JMt6S1bztYIeQ+Q0r5DTYVKTT1II6PMpNnp9XsQr/gpOhg2b3f8C/vYdZxtAM=
X-Received: by 2002:a05:6512:1311:: with SMTP id
	x17mr17837516lfu.307.1614142679263; 
	Tue, 23 Feb 2021 20:57:59 -0800 (PST)
MIME-Version: 1.0
References: <161340385320.1303470.2392622971006879777.stgit@warthog.procyon.org.uk>
	<9e49f96cd80eaf9c8ed267a7fbbcb4c6467ee790.camel@redhat.com>
	<CAH2r5mvPLivjuE=cbijzGSHOvx-hkWSWbcxpoBnJX-BR9pBskQ@mail.gmail.com>
	<20210216021015.GH2858050@casper.infradead.org>
	<CAH2r5mv+AdiODH1TSL+SOQ5qpZ25n7Ysrp+iYxauX9sD8ehhVQ@mail.gmail.com>
	<20210223202742.GM2858050@casper.infradead.org>
In-Reply-To: <20210223202742.GM2858050@casper.infradead.org>
From: Steve French <smfrench@gmail.com>
Date: Tue, 23 Feb 2021 22:57:48 -0600
Message-ID: <CAH2r5ms06hL0f5+ejXJTYE7_8rO4SZRW+-ZeWETNFiXDPu1Jbg@mail.gmail.com>
To: Matthew Wilcox <willy@infradead.org>
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
X-Mailman-Approved-At: Wed, 24 Feb 2021 05:56:13 -0500
Cc: Dominique Martinet <asmadeus@codewreck.org>, Chao Yu <yuchao0@huawei.com>,
	William Kucharski <william.kucharski@oracle.com>,
	linux-afs@lists.infradead.org, CIFS <linux-cifs@vger.kernel.org>,
	Case van Rij <case.vanrij@gmail.com>,
	Christoph Hellwig <hch@lst.de>, linux-cachefs@redhat.com,
	Trond Myklebust <trondmy@hammerspace.com>,
	v9fs-developer@lists.sourceforge.net,
	Alexander Viro <viro@zeniv.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
	ceph-devel <ceph-devel@vger.kernel.org>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Feb 23, 2021 at 2:28 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Mon, Feb 15, 2021 at 11:22:20PM -0600, Steve French wrote:
> > On Mon, Feb 15, 2021 at 8:10 PM Matthew Wilcox <willy@infradead.org> wrote:
> > > The switch from readpages to readahead does help in a couple of corner
> > > cases.  For example, if you have two processes reading the same file at
> > > the same time, one will now block on the other (due to the page lock)
> > > rather than submitting a mess of overlapping and partial reads.
> >
> > Do you have a simple repro example of this we could try (fio, dbench, iozone
> > etc) to get some objective perf data?
>
> I don't.  The problem was noted by the f2fs people, so maybe they have a
> reproducer.
>
> > My biggest worry is making sure that the switch to netfs doesn't degrade
> > performance (which might be a low bar now since current network file copy
> > perf seems to signifcantly lag at least Windows), and in some easy to understand
> > scenarios want to make sure it actually helps perf.
>
> I had a question about that ... you've mentioned having 4x4MB reads
> outstanding as being the way to get optimum performance.  Is there a
> significant performance difference between 4x4MB, 16x1MB and 64x256kB?
> I'm concerned about having "too large" an I/O on the wire at a given time.
> For example, with a 1Gbps link, you get 250MB/s.  That's a minimum
> latency of 16us for a 4kB page, but 16ms for a 4MB page.
>
> "For very simple tasks, people can perceive latencies down to 2 ms or less"
> (https://danluu.com/input-lag/)
> so going all the way to 4MB I/Os takes us into the perceptible latency
> range, whereas a 256kB I/O is only 1ms.
>
> So could you do some experiments with fio doing direct I/O to see if
> it takes significantly longer to do, say, 1TB of I/O in 4MB chunks vs
> 256kB chunks?  Obviously use threads to keep lots of I/Os outstanding.

That is a good question and it has been months since I have done experiments
with something similar.   Obviously this will vary depending on RDMA or not and
multichannel or not - but assuming the 'normal' low end network configuration -
ie a 1Gbps link and no RDMA or multichannel I could do some more recent
experiments.

In the past what I had noticed was that server performance for simple
workloads like cp or grep increased with network I/O size to a point:
smaller than 256K packet size was bad. Performance improved
significantly from 256K to 512K to 1MB, but only very
slightly from 1MB to 2MB to 4MB and sometimes degraded at 8MB
(IIRC 8MB is the max commonly supported by SMB3 servers),
but this is with only one adapter (no multichannel) and 1Gb adapters.

But in those examples there wasn't a lot of concurrency on the wire.

I did some experiments with increasing the read ahead size
(which causes more than one async read to be issued by cifs.ko
but presumably does still result in some 'dead time')
which seemed to help perf of some sequential read examples
(e.g. grep or cp) to some servers but I didn't try enough variety
of server targets to feel confident about that change especially
if netfs is coming

e.g. a change I experimented with was:
         sb->s_bdi->ra_pages = cifs_sb->ctx->rsize / PAGE_SIZE
to
         sb->s_bdi->ra_pages = 2 * cifs_sb->ctx->rsize / PAGE_SIZE

and it did seem to help a little.

I would expect that 8x1MB (ie trying to keep eight 1MB reads in process should
keep the network mostly busy and not lead to too much dead time on
server, client
or network) and is 'good enough' in many read ahead use cases (at
least for non-RDMA, and non-multichannel on a slower network) to keep the pipe
file, and I would expect the performance to be similar to the equivalent using
2MB read (e.g. 4x2MB) and perhaps better than 2x4MB.  Below 1MB i/o size
on the wire I would expect to see degradation due to packet processing
and task switching
overhead.  Would definitely be worth doing more experimentation here.
-- 
Thanks,

Steve

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

