Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1A3A7322858
	for <lists+linux-cachefs@lfdr.de>; Tue, 23 Feb 2021 11:00:01 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-524-C3yiIMsKOFmr59RQ7l_-fA-1; Tue, 23 Feb 2021 04:59:58 -0500
X-MC-Unique: C3yiIMsKOFmr59RQ7l_-fA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 134F418B62A9;
	Tue, 23 Feb 2021 09:59:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F3F30722CE;
	Tue, 23 Feb 2021 09:59:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D949218077C0;
	Tue, 23 Feb 2021 09:59:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11G5INZi020454 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 16 Feb 2021 00:18:23 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 187D8112C084; Tue, 16 Feb 2021 05:18:23 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1467B106A743
	for <linux-cachefs@redhat.com>; Tue, 16 Feb 2021 05:18:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6EE5A186E121
	for <linux-cachefs@redhat.com>; Tue, 16 Feb 2021 05:18:20 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
	[209.85.167.52]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-144-Ov4YpZ6yNpK4PuUAdqRznw-1; Tue, 16 Feb 2021 00:18:15 -0500
X-MC-Unique: Ov4YpZ6yNpK4PuUAdqRznw-1
Received: by mail-lf1-f52.google.com with SMTP id d24so13921945lfs.8;
	Mon, 15 Feb 2021 21:18:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wujt3rEkfz1gBVeqiGJuebMiBQ6EXLfMvV1N3ToSLEg=;
	b=nbLxd+4YFj86dOrHteWdKD1Sz0+7SKLlEzrE37NQcnk5ujvNN0mAJv4aawCyb/ckdS
	lxbKXU4Pxrg/E1TodNAiGILmJOAQVXRHARs396AKY7CcDTLYheJKvd4KLsade6RjwRZ/
	jcbLLN4gGpxyfBZXywT1cNMR+ccKYDYU/G5dgHJa+1tGZa+o8/Hhz+Mqf2SpFgOdjLmm
	Ys7+tv4KHtich5nOoz4oA9V39UzlVmUbr/xxuGZf1g9e/a6se9HSIKOuRRnLgnCCyV7U
	5qF6M5vm1kxRDVCmip9fZ1edLZ3ayrWTAcIXY4kpvmcQoiV0KTp3d4Z+xlB0ae2vLsHS
	lyvQ==
X-Gm-Message-State: AOAM533N6NcXVxpU2RyNOSLEIJHwTn+oznSie7zX3kQUYLgpswiUjxzt
	x2QtXNtdgWg0mgVJQca8LFsxKdI0mxsymiVdUH4=
X-Google-Smtp-Source: ABdhPJy9H3EXUc8XuYPIQKDxwM3oPFRhR4c+QWVWNLoFZd2YMqS0S6y9PDhVsr2YqLR65ivGiOSLLFSUYk3dT5a6PGE=
X-Received: by 2002:a05:6512:2118:: with SMTP id
	q24mr4994475lfr.133.1613452693694; 
	Mon, 15 Feb 2021 21:18:13 -0800 (PST)
MIME-Version: 1.0
References: <161340385320.1303470.2392622971006879777.stgit@warthog.procyon.org.uk>
	<9e49f96cd80eaf9c8ed267a7fbbcb4c6467ee790.camel@redhat.com>
	<CAH2r5mvPLivjuE=cbijzGSHOvx-hkWSWbcxpoBnJX-BR9pBskQ@mail.gmail.com>
	<20210216021015.GH2858050@casper.infradead.org>
In-Reply-To: <20210216021015.GH2858050@casper.infradead.org>
From: Steve French <smfrench@gmail.com>
Date: Mon, 15 Feb 2021 23:18:02 -0600
Message-ID: <CAH2r5mv=PZk_wn2=b0VQcaom9TEw1MGLz+qB_Ktxxm2bnV9Nig@mail.gmail.com>
To: Matthew Wilcox <willy@infradead.org>
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
X-Mailman-Approved-At: Tue, 23 Feb 2021 04:59:26 -0500
Cc: Steve French <sfrench@samba.org>, linux-nfs <linux-nfs@vger.kernel.org>,
	William Kucharski <william.kucharski@oracle.com>,
	CIFS <linux-cifs@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Dominique Martinet <asmadeus@codewreck.org>,
	LKML <linux-kernel@vger.kernel.org>,
	linux-afs@lists.infradead.org, linux-mm <linux-mm@kvack.org>,
	linux-cachefs@redhat.com, Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>, Anna Schumaker <anna.schumaker@netapp.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Feb 15, 2021 at 8:10 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Mon, Feb 15, 2021 at 06:40:27PM -0600, Steve French wrote:
> > It could be good if netfs simplifies the problem experienced by
> > network filesystems on Linux with readahead on large sequential reads
> > - where we don't get as much parallelism due to only having one
> > readahead request at a time (thus in many cases there is 'dead time'
> > on either the network or the file server while waiting for the next
> > readpages request to be issued).   This can be a significant
> > performance problem for current readpages when network latency is long
> > (or e.g. in cases when network encryption is enabled, and hardware
> > offload not available so time consuming on the server or client to
> > encrypt the packet).
> >
> > Do you see netfs much faster than currentreadpages for ceph?
> >
> > Have you been able to get much benefit from throttling readahead with
> > ceph from the current netfs approach for clamping i/o?
>
> The switch from readpages to readahead does help in a couple of corner
> cases.  For example, if you have two processes reading the same file at
> the same time, one will now block on the other (due to the page lock)
> rather than submitting a mess of overlapping and partial reads.
>
> We're not there yet on having multiple outstanding reads.  Bill and I
> had a chat recently about how to make the readahead code detect that
> it is in a "long fat pipe" situation (as opposed to just dealing with
> a slow device), and submit extra readahead requests to make best use of
> the bandwidth and minimise blocking of the application.
>
> That's not something for the netfs code to do though; we can get into
> that situation with highly parallel SSDs.

This (readahead behavior improvements in Linux, on single large file sequential
read workloads like cp or grep) gets particularly interesting
with SMB3 as multichannel becomes more common.  With one channel having
one readahead request pending on the network is suboptimal - but not as bad as
when multichannel is negotiated. Interestingly in most cases two
network connections
to the same server (different TCP sockets,but the same mount, even in
cases where
only network adapter) can achieve better performance - but still significantly
lags Windows (and probably other clients) as in Linux we don't keep
multiple I/Os
in flight at one time (unless different files are being read at the same time
by different threads).   As network adapters are added and removed from the
server (other client typically poll to detect interface changes, and SMB3
also leverages the "witness protocol" to get notification of adapter additions
or removals) - it would be helpful to change the maximum number of
readahead requests in flight.  In addition, as the server throttles back
(reducing the number of 'credits' granted to the client) it will be important
to give hints to the readahead logic about reducing the number of
read ahead requests in flight.   Keeping multiple readahead requests
is easier to imagine when multiple processes are copying or reading
files, but there are many scenarios where we could do better with parallelizing
a single process doing copy by ensuring that there is no 'dead time' on
the network.


-- 
Thanks,

Steve

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

