Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D38C4401C7
	for <lists+linux-cachefs@lfdr.de>; Fri, 29 Oct 2021 20:18:37 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-xhnkKa8aPPqf7bf6AcTV_w-1; Fri, 29 Oct 2021 14:18:33 -0400
X-MC-Unique: xhnkKa8aPPqf7bf6AcTV_w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F5151006AA5;
	Fri, 29 Oct 2021 18:18:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 53DB610016F4;
	Fri, 29 Oct 2021 18:18:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E270D4A703;
	Fri, 29 Oct 2021 18:18:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19TIIQdU003209 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 29 Oct 2021 14:18:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C30B751DD; Fri, 29 Oct 2021 18:18:26 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BCDED51DC
	for <linux-cachefs@redhat.com>; Fri, 29 Oct 2021 18:18:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 61DCF18019D7
	for <linux-cachefs@redhat.com>; Fri, 29 Oct 2021 18:18:21 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
	[209.85.208.176]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-411-If3dVMCXN8-f31GsrrqpMA-1; Fri, 29 Oct 2021 14:18:19 -0400
X-MC-Unique: If3dVMCXN8-f31GsrrqpMA-1
Received: by mail-lj1-f176.google.com with SMTP id h11so18255612ljk.1
	for <linux-cachefs@redhat.com>; Fri, 29 Oct 2021 11:18:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=YR8MaXQV2dAoTf7veoG8XVBeAhgdgomPxezXzaQONmo=;
	b=fKmFuxh+AAly9mhb60vmwhpF4p7HYIf3Al/KkJiLTjqmCFwRwsjIIzgxTub7W9vbVF
	xaQSjxUZQcpWUxG/7fmpioqsAQI8cqIE6C9/i/C3txb9OeCFOMzjGiOgS7adgkjTY+S5
	Sfu09gMcVpl77VJsd5ch9kmhJXFWUbv3iRlkWWMoWYKXnFMAIaTlxEPriJVH7tSJtCVZ
	ACB+kkrRXmMMKw4v/q8k7+DFr/cED+oA822wAqMIlMNZOi2jBpH7z0DPnPuF6tQ9WVEl
	lc3gRJTDERtH+nwkcocscj54pZlrvi5SmZz++SdRKs2x6XiihyFCy+WqQA2EasvksPdC
	as9w==
X-Gm-Message-State: AOAM532A/54LY0YK2cEf4gYllnzFPSTZBJ9zu58/m6e507T2zltCjRhv
	lFnEw5/AIoIdIAZ2EoDcq5whV87xTbfrlJFUcZk=
X-Google-Smtp-Source: ABdhPJypNx5Ti4kGlv3w9JbOzAhPAkNFRhfWOCyqNQbXVY2zF/tLQTHBoLq2h/F+G7SQtRDcWO+ydQ==
X-Received: by 2002:a2e:a5c4:: with SMTP id n4mr12973097ljp.72.1635531497318; 
	Fri, 29 Oct 2021 11:18:17 -0700 (PDT)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com.
	[209.85.208.178])
	by smtp.gmail.com with ESMTPSA id k2sm665726lfg.275.2021.10.29.11.18.15
	for <linux-cachefs@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 29 Oct 2021 11:18:16 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id 1so12294724ljv.2
	for <linux-cachefs@redhat.com>; Fri, 29 Oct 2021 11:18:15 -0700 (PDT)
X-Received: by 2002:a05:651c:17a6:: with SMTP id
	bn38mr12949536ljb.56.1635531495482; 
	Fri, 29 Oct 2021 11:18:15 -0700 (PDT)
MIME-Version: 1.0
References: <163551653404.1877519.12363794970541005441.stgit@warthog.procyon.org.uk>
	<CAHk-=wiy4KNREEqvd10Ku8VVSY1Lb=fxTA1TzGmqnLaHM3gdTg@mail.gmail.com>
	<1889041.1635530124@warthog.procyon.org.uk>
In-Reply-To: <1889041.1635530124@warthog.procyon.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 29 Oct 2021 11:17:59 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg_C6V_S+Aox5Fn7MuFe13ADiRVnh6UcvY4WX9JjXn3dg@mail.gmail.com>
Message-ID: <CAHk-=wg_C6V_S+Aox5Fn7MuFe13ADiRVnh6UcvY4WX9JjXn3dg@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
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
Cc: CIFS <linux-cifs@vger.kernel.org>, "open list:NFS, SUNRPC,
	AND..." <linux-nfs@vger.kernel.org>, linux-afs@lists.infradead.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Shyam Prasad N <nspmangalore@gmail.com>,
	Matthew Wilcox <willy@infradead.org>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Steve French <sfrench@samba.org>, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH v4 00/10] fscache: Replace and remove
	old I/O API
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Oct 29, 2021 at 10:55 AM David Howells <dhowells@redhat.com> wrote:
>
> This means bisection is of limited value and why I'm looking at a 'flag day'.

So I'm kind of resigned to that by now, I just wanted to again clarify
that the rest of my comments are about "if we have to deal with a flag
dat anyway, then make it as simple and straightforward as possible,
rather than adding extra steps that are only noise".

> [ Snip explanation of netfslib ]
> This particular patchset is intended to enable removal of the old I/O routines
> by changing nfs and cifs to use a "fallback" method to use the new kiocb-using
> API and thus allow me to get on with the rest of it.

Ok, at least that explains that part.

But:

> However, if you would rather I just removed all of fscache and (most of[*])
> cachefiles, that I can do.

I assume and think that if you just do that part first, then the
"convert to netfslib" of afs and ceph at that later stage will mean
that the fallback code will never be needed?

So I would much prefer that streamlined model over one that adds that
temporary intermediate stage only for it to be deleted.

             Linus

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

