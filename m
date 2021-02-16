Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6D66832286A
	for <lists+linux-cachefs@lfdr.de>; Tue, 23 Feb 2021 11:01:25 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467--clzQvWbMgSstTzZJi_NPA-1; Tue, 23 Feb 2021 04:59:47 -0500
X-MC-Unique: -clzQvWbMgSstTzZJi_NPA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D9481007303;
	Tue, 23 Feb 2021 09:59:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C1BE70478;
	Tue, 23 Feb 2021 09:59:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4527B18095CC;
	Tue, 23 Feb 2021 09:59:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11G5MfN1020807 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 16 Feb 2021 00:22:42 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CC87220CA48A; Tue, 16 Feb 2021 05:22:41 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C4EF020CA48B
	for <linux-cachefs@redhat.com>; Tue, 16 Feb 2021 05:22:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6769281DA55
	for <linux-cachefs@redhat.com>; Tue, 16 Feb 2021 05:22:38 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
	[209.85.167.46]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-543-nPoGpCgPM8COUc4PmXfrSw-1; Tue, 16 Feb 2021 00:22:34 -0500
X-MC-Unique: nPoGpCgPM8COUc4PmXfrSw-1
Received: by mail-lf1-f46.google.com with SMTP id v5so13884648lft.13;
	Mon, 15 Feb 2021 21:22:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=r7yF3z7ORk4Hs+lXeZICPrDRsFJoinna0ZNMygBvUq4=;
	b=Sg8VTpFz2PMeuTSkRcB5Adahuwdx7KicpBzzKnc2nM1wI/+QZDTtlqyILrP6Y5yza4
	e3rY3LUn12lkgLSRGtr9NNWidD7lKnSZaN/WR8LtK7C+VUVlhVN22Yp703V5Yr38aIYm
	Porp/ej1Qc6lEtrfIVo64sB/RPRPed9y/n+BQRjnPYY2/IoXCtQOe7Ww6xV+2bxA0QeQ
	o9/Z6hi0XRwRm2etCW9DCfukOSWFezZuupvJBvpYvYGA+ggWKtaB48x6FstMBzX34X+p
	edgovU9F5fK1RFmAt02kF05qPPv6XGv/HxlZ6YPVEn4g03eZ6nSoSenpn1QsVAWtk2du
	ogWg==
X-Gm-Message-State: AOAM533iIkMSurGfWIC6iYFeSt2lo8LneQLmGsvLH0KbzWCOOY4wfr5u
	6Cexk2tLFKHwKi688Gp2TYSWW6WOCEFIRi6ZrMk=
X-Google-Smtp-Source: ABdhPJytw/XzbIWleKkW+UNIXt86HNGxwpyD+NXYNCrONiCZVl2ZgbD2MAcasnzpl4KhIL873RGx/GWBBwdp2/0yqbw=
X-Received: by 2002:a19:80d1:: with SMTP id
	b200mr11220680lfd.184.1613452951921; 
	Mon, 15 Feb 2021 21:22:31 -0800 (PST)
MIME-Version: 1.0
References: <161340385320.1303470.2392622971006879777.stgit@warthog.procyon.org.uk>
	<9e49f96cd80eaf9c8ed267a7fbbcb4c6467ee790.camel@redhat.com>
	<CAH2r5mvPLivjuE=cbijzGSHOvx-hkWSWbcxpoBnJX-BR9pBskQ@mail.gmail.com>
	<20210216021015.GH2858050@casper.infradead.org>
In-Reply-To: <20210216021015.GH2858050@casper.infradead.org>
From: Steve French <smfrench@gmail.com>
Date: Mon, 15 Feb 2021 23:22:20 -0600
Message-ID: <CAH2r5mv+AdiODH1TSL+SOQ5qpZ25n7Ysrp+iYxauX9sD8ehhVQ@mail.gmail.com>
To: Matthew Wilcox <willy@infradead.org>
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

Do you have a simple repro example of this we could try (fio, dbench, iozone
etc) to get some objective perf data?

My biggest worry is making sure that the switch to netfs doesn't degrade
performance (which might be a low bar now since current network file copy
perf seems to signifcantly lag at least Windows), and in some easy to understand
scenarios want to make sure it actually helps perf.

-- 
Thanks,

Steve

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

