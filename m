Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE794905DA
	for <lists+linux-cachefs@lfdr.de>; Mon, 17 Jan 2022 11:24:13 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-113-47Y1mHb2Pf673Rn7V4TnJA-1; Mon, 17 Jan 2022 05:24:09 -0500
X-MC-Unique: 47Y1mHb2Pf673Rn7V4TnJA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 407F664143;
	Mon, 17 Jan 2022 10:24:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A81F1108C2;
	Mon, 17 Jan 2022 10:24:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1E9E34CA9B;
	Mon, 17 Jan 2022 10:24:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20HAJskW006209 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 17 Jan 2022 05:19:54 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5091A2166B2F; Mon, 17 Jan 2022 10:19:54 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A6112166B25
	for <linux-cachefs@redhat.com>; Mon, 17 Jan 2022 10:19:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 42E5F181E090
	for <linux-cachefs@redhat.com>; Mon, 17 Jan 2022 10:19:51 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
	[209.85.208.48]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-481-nEN51f_OMFy45aTFhtLwAQ-1; Mon, 17 Jan 2022 05:19:49 -0500
X-MC-Unique: nEN51f_OMFy45aTFhtLwAQ-1
Received: by mail-ed1-f48.google.com with SMTP id m4so63320679edb.10
	for <linux-cachefs@redhat.com>; Mon, 17 Jan 2022 02:19:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4/B8S0T6l/cNTFCwbllAbkeryrIurv7WGfpD2SElg7M=;
	b=yedd/kFJn0Fo1I4vA6jEHRpmu+FTyIzXJ3Px7MrGev57Tmh+ZIVCkJKeqMa+7Op4a1
	ngadEYTq5ATJVZCC+43WbsL/jXVq/psvZErrTxivXcLKNneDIsbdvOXAUG4DkzLdSvm3
	7KzySVJzA2tJdG+NrPx9NURG9Yr8ELWXNL1DtPn42p8ALamt7N3aTpxtgr2bBhyFtuZB
	I8pBv2Vj/29xjuLZ9dpdQfbSCMz4uPY+HotxcWZwxilzWd2maf2PS/lr/ymZ0e7GMgbB
	MqsuA7AGCuIb+oz8Dvf26rIJ3NYLVrMLzS/WlbwaqodpF2fH91Y01cgDP9oxPPlnjMsZ
	anHA==
X-Gm-Message-State: AOAM531C6nHYf/1DTI+2/ZWYEB06T4xBj7/XqgpRCqO9JjliUqaX0bTx
	zZWeKDqTbnj+maBaVGry7vxbRUwpoa2hTnnh
X-Google-Smtp-Source: ABdhPJxApryvpQFoHcGsD7/PV35FBEiqx9UzbmcSn3z3MT5FPWph8myEFPomfWiAyU5OoejcSRgQCA==
X-Received: by 2002:a17:907:6e02:: with SMTP id
	sd2mr15972426ejc.276.1642414787990; 
	Mon, 17 Jan 2022 02:19:47 -0800 (PST)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com.
	[209.85.128.46]) by smtp.gmail.com with ESMTPSA id
	e28sm4334542ejm.96.2022.01.17.02.19.45 for <linux-cachefs@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 17 Jan 2022 02:19:46 -0800 (PST)
Received: by mail-wm1-f46.google.com with SMTP id
	d18-20020a05600c251200b0034974323cfaso23116164wma.4
	for <linux-cachefs@redhat.com>; Mon, 17 Jan 2022 02:19:45 -0800 (PST)
X-Received: by 2002:a05:600c:3482:: with SMTP id
	a2mr3476469wmq.152.1642414785683; 
	Mon, 17 Jan 2022 02:19:45 -0800 (PST)
MIME-Version: 1.0
References: <2752208.1642413437@warthog.procyon.org.uk>
In-Reply-To: <2752208.1642413437@warthog.procyon.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 17 Jan 2022 12:19:29 +0200
X-Gmail-Original-Message-ID: <CAHk-=wjQG5HnwQD98z8de1EvRzDnebZxh=gQUVTKCn0DOp7PQw@mail.gmail.com>
Message-ID: <CAHk-=wjQG5HnwQD98z8de1EvRzDnebZxh=gQUVTKCn0DOp7PQw@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
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
Cc: Latchesar Ionkov <lucho@ionkov.net>, Peter Zijlstra <peterz@infradead.org>,
	Dominique Martinet <asmadeus@codewreck.org>, Linux-MM <linux-mm@kvack.org>,
	Marc Dionne <marc.dionne@auristor.com>, linux-afs@lists.infradead.org,
	Shyam Prasad N <nspmangalore@gmail.com>, CIFS <linux-cifs@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>, linux-cachefs@redhat.com,
	Trond Myklebust <trondmy@hammerspace.com>,
	v9fs-developer@lists.sourceforge.net,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	ceph-devel@vger.kernel.org, "open list:NFS, SUNRPC,
	AND..." <linux-nfs@vger.kernel.org>, Jeff Layton <jlayton@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Steve French <sfrench@samba.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Omar Sandoval <osandov@osandov.com>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] Out of order read() completion and buffer
	filling beyond returned amount
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jan 17, 2022 at 11:57 AM David Howells <dhowells@redhat.com> wrote:
>
> Do you have an opinion on whether it's permissible for a filesystem to write
> into the read() buffer beyond the amount it claims to return, though still
> within the specified size of the buffer?

I'm pretty sure that would seriously violate POSIX in the general
case, and maybe even break some programs that do fancy buffer
management (ie I could imagine some circular buffer thing that expects
any "unwritten" ('unread'?) parts to stay with the old contents)

That said, that's for generic 'read()' cases for things like tty's or
pipes etc that can return partial reads in the first place.

If it's a regular file, then any partial read *already* violates
POSIX, and nobody sane would do any such buffer management because
it's supposed to be a 'can't happen' thing.

And since you mention DIO, that's doubly true, and is already outside
basic POSIX, and has already violated things like "all or nothing"
rules for visibility of writes-vs-reads (which admittedly most Linux
filesystems have violated even outside of DIO, since the strictest
reading of the rules are incredibly nasty anyway). But filesystems
like XFS which took some of the strict rules more seriously already
ignored them for DIO, afaik.

So I suspect you're fine. Buffered reads might care more, but even
there the whole "you can't really validly have partial reads anyway"
thing is a bigger violation to begin with.

With DIO, I suspect nobody cares about _those_ kinds of semantic
details. People who use DIO tend to care primarily about performance -
it's why they use it, after all - and are probably more than happy to
be lax about other rules.

But maybe somebody would prefer to have a mount option to specify just
how out-of-spec things can be (ie like the traditional old nfs 'intr'
thing). If only for testing, and for 'in case some odd app breaks'

                Linus

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

