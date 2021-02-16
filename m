Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8589932287C
	for <lists+linux-cachefs@lfdr.de>; Tue, 23 Feb 2021 11:02:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614074554;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=p5PFR7+GOcZU07HA53dGpxsvRMbsW8GIUIhmWAPdfds=;
	b=FHji+pA0zPA5xHBguPy0TQRE5hWEEWXnb2ZeTmus2LzzN6d9mxK2TZUlL2ta6wNaAeuDHu
	HsdHfAfhiWIwd+A5Sv5sO4HzHakfoLaBZNOLgAt0ayUOnZvUO1Haz5h8btLoeLjLYVNz00
	NvcKF48yi2jb0gCfmCH0vbiPEv3KREc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-76nxQGDmOBCd6Qvki3I7CA-1; Tue, 23 Feb 2021 04:59:46 -0500
X-MC-Unique: 76nxQGDmOBCd6Qvki3I7CA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C4E6100944E;
	Tue, 23 Feb 2021 09:59:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2BE9C679FF;
	Tue, 23 Feb 2021 09:59:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1715E18089DA;
	Tue, 23 Feb 2021 09:59:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11GB1PoS023631 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 16 Feb 2021 06:01:25 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1D0F6EE87C; Tue, 16 Feb 2021 11:01:25 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 14A77C212E
	for <linux-cachefs@redhat.com>; Tue, 16 Feb 2021 11:01:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B815C8007D9
	for <linux-cachefs@redhat.com>; Tue, 16 Feb 2021 11:01:22 +0000 (UTC)
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
	[209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-422-pPCttqU2O4ec5qcvb6fG8A-1; Tue, 16 Feb 2021 06:01:21 -0500
X-MC-Unique: pPCttqU2O4ec5qcvb6fG8A-1
Received: by mail-qt1-f198.google.com with SMTP id f5so7410362qtf.15
	for <linux-cachefs@redhat.com>; Tue, 16 Feb 2021 03:01:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=UjPevUc/f1h27YC/iWCBse0mv72F3ucIKOdIwEX5LG8=;
	b=DLHwYCaSakSDFqlEljj6e3W/Db2OqK/YyIJt/tD5jOYEC8wnHOItg9+CiuSztI3JoW
	vmEcsmp9kSfelm49W3djFhLR3UUN4uYW2IBANh510p/MlppgMmtfJ15Ty80LNp8nwCGs
	rEXI7K3aMIHfjC/Ek4seqqg4KzDeh+wvyXJFya4YyFLCafje2e8ealGwE1f8JgF9Jf3I
	BE7F8XCJo+DSJ2KZaZxPpoOc062tdF0uLhukxpD9kVkMl3TzotdalbT8kOHlht3i+0Ev
	FM1bvGpOjyxYGldZfjQImHoqXhFjRvpAl94sEL11Q6Xf6XWrF+iac40rfBPPm7bdvbm/
	nxfg==
X-Gm-Message-State: AOAM533J8CHXEkbS3Io8tZV91ulWPOnIjkegne1KpM0G8x0G5YAyB+6i
	mxjiiOljV+RM1I/6EdGA33naHJQd8LdxEsuAX5AfqMd5jd2a+aY5qKzA4ZNR3H29Szm8j03tcQY
	FZFrrkWLLXIBRuJgKsjmOEA==
X-Received: by 2002:a05:6214:292:: with SMTP id
	l18mr19206669qvv.5.1613473277869; 
	Tue, 16 Feb 2021 03:01:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwfxkMdLP8GICFrYv5qcHZzcwXchEHaGAgSDG1h4XsMOzzlGSXOw3kqQRk/cyROnYM/B9O9Vw==
X-Received: by 2002:a05:6214:292:: with SMTP id
	l18mr19206653qvv.5.1613473277670; 
	Tue, 16 Feb 2021 03:01:17 -0800 (PST)
Received: from tleilax.poochiereds.net
	(68-20-15-154.lightspeed.rlghnc.sbcglobal.net. [68.20.15.154])
	by smtp.gmail.com with ESMTPSA id n5sm13100571qtd.5.2021.02.16.03.01.16
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 16 Feb 2021 03:01:17 -0800 (PST)
Message-ID: <752a8c91b7a418fa52cb8a8f28cb30155a574904.camel@redhat.com>
From: Jeff Layton <jlayton@redhat.com>
To: Steve French <smfrench@gmail.com>
Date: Tue, 16 Feb 2021 06:01:16 -0500
In-Reply-To: <CAH2r5mvPLivjuE=cbijzGSHOvx-hkWSWbcxpoBnJX-BR9pBskQ@mail.gmail.com>
References: <161340385320.1303470.2392622971006879777.stgit@warthog.procyon.org.uk>
	<9e49f96cd80eaf9c8ed267a7fbbcb4c6467ee790.camel@redhat.com>
	<CAH2r5mvPLivjuE=cbijzGSHOvx-hkWSWbcxpoBnJX-BR9pBskQ@mail.gmail.com>
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Tue, 23 Feb 2021 04:59:26 -0500
Cc: Steve French <sfrench@samba.org>, linux-nfs <linux-nfs@vger.kernel.org>,
	CIFS <linux-cifs@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Dominique Martinet <asmadeus@codewreck.org>,
	LKML <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 2021-02-15 at 18:40 -0600, Steve French wrote:
> Jeff,
> What are the performance differences you are seeing (positive or
> negative) with ceph and netfs, especially with simple examples like
> file copy or grep of large files?
> 
> It could be good if netfs simplifies the problem experienced by
> network filesystems on Linux with readahead on large sequential reads
> - where we don't get as much parallelism due to only having one
> readahead request at a time (thus in many cases there is 'dead time'
> on either the network or the file server while waiting for the next
> readpages request to be issued).   This can be a significant
> performance problem for current readpages when network latency is long
> (or e.g. in cases when network encryption is enabled, and hardware
> offload not available so time consuming on the server or client to
> encrypt the packet).
> 
> Do you see netfs much faster than currentreadpages for ceph?
> 
> Have you been able to get much benefit from throttling readahead with
> ceph from the current netfs approach for clamping i/o?
> 

I haven't seen big performance differences at all with this set. It's
pretty much a wash, and it doesn't seem to change how the I/Os are
ultimately driven on the wire. For instance, the clamp_length op
basically just mirrors what ceph does today -- it ensures that the
length of the I/O can't go past the end of the current object.

The main benefits are that we get a large swath of readpage, readpages
amd write_begin code out of ceph altogether. All of the netfs's need to
gather and vet pages for I/O, etc. Most of that doesn't have anything to
do with the filesystem itself. By offloading that into the netfs lib,
most of that is taken care of for us and we don't need to bother with
doing that ourselves.

-- 
Jeff Layton <jlayton@redhat.com>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

