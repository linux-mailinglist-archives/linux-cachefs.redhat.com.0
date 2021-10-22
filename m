Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5029F437EF1
	for <lists+linux-cachefs@lfdr.de>; Fri, 22 Oct 2021 21:58:49 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-JAQR8ZHkOjWHoYyRWNfaxw-1; Fri, 22 Oct 2021 15:58:45 -0400
X-MC-Unique: JAQR8ZHkOjWHoYyRWNfaxw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 153D61808317;
	Fri, 22 Oct 2021 19:58:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 716A15D9DE;
	Fri, 22 Oct 2021 19:58:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DC2731800B9E;
	Fri, 22 Oct 2021 19:58:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19MJwYPx017492 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 22 Oct 2021 15:58:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B2ACF40C1257; Fri, 22 Oct 2021 19:58:34 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AEA76400F3F3
	for <linux-cachefs@redhat.com>; Fri, 22 Oct 2021 19:58:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9555D185A7A4
	for <linux-cachefs@redhat.com>; Fri, 22 Oct 2021 19:58:34 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
	[209.85.167.45]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-197-V1M0NdgnMoyph7uKK9UQsQ-1; Fri, 22 Oct 2021 15:58:33 -0400
X-MC-Unique: V1M0NdgnMoyph7uKK9UQsQ-1
Received: by mail-lf1-f45.google.com with SMTP id p16so136522lfa.2
	for <linux-cachefs@redhat.com>; Fri, 22 Oct 2021 12:58:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OyTESXkijXq7pnJGTLADUG+9VskuYUOHv78z9I+1K/4=;
	b=eZt7+Un2YXnG4N65QPH4orPLDT4YVhpLUW3bY+zjXn95CJY8lz9CnD/PzdPPqFdfbZ
	6evbJuB55oBBY9AAcmEW9tovglWYSxIcE8LeOtdBSa3In9VU4qNuK0hXdz7W6D08G5Nl
	2qlZjfciR4QWRzU8h1Y8E5reyX/6jg+F29VSQsvfTO5juVcI8etQ8RSZDRoWbCOvQumT
	Z3oQdOf6zVBaAuc6/gc6pr144OHf9Y1yETIVGhFPmn55Mx9bucUUMb3mW+PZGQPP+2Wn
	0aNPrGkZhtKSUpDZryHg3YFYaxq/BxO49bEWVnn+HESzxHpDJ8HefTiYjQXguguc1bJ2
	OIJw==
X-Gm-Message-State: AOAM530pIQ0k5Wa0pW7GYoWhzi5BV9JKUNztlGAVg3nXJ4ao/zn+FsG5
	YtciCCsJFncdqQ9VUGN6mbb/VerJGam3BQRMWDQ=
X-Google-Smtp-Source: ABdhPJz8Q3erTKNpU4RpSHhm7LVCM/P+6Ys8k4fs0LzbZSlb34cM43sSbGT2oIAqnnrfB6Son7Eewg==
X-Received: by 2002:a05:6512:3e16:: with SMTP id
	i22mr1698730lfv.374.1634932710939; 
	Fri, 22 Oct 2021 12:58:30 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com.
	[209.85.208.182]) by smtp.gmail.com with ESMTPSA id
	x10sm501590lfa.177.2021.10.22.12.58.28 for <linux-cachefs@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 22 Oct 2021 12:58:28 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id 145so639795ljj.1
	for <linux-cachefs@redhat.com>; Fri, 22 Oct 2021 12:58:28 -0700 (PDT)
X-Received: by 2002:a2e:5cc7:: with SMTP id q190mr2066391ljb.494.1634932708154;
	Fri, 22 Oct 2021 12:58:28 -0700 (PDT)
MIME-Version: 1.0
References: <163492911924.1038219.13107463173777870713.stgit@warthog.procyon.org.uk>
	<CAHk-=wjmx7+PD0hzWj5Bg2b807xYD2KCZApTvFje=ufo+MxBMQ@mail.gmail.com>
	<1041557.1634931616@warthog.procyon.org.uk>
In-Reply-To: <1041557.1634931616@warthog.procyon.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 22 Oct 2021 09:58:12 -1000
X-Gmail-Original-Message-ID: <CAHk-=wg2LQtWC3e4Z4EGQzEmsLjmk6jm67Ga6UMLY1MH6iDcNQ@mail.gmail.com>
Message-ID: <CAHk-=wg2LQtWC3e4Z4EGQzEmsLjmk6jm67Ga6UMLY1MH6iDcNQ@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-loop: linux-cachefs@redhat.com
Cc: Latchesar Ionkov <lucho@ionkov.net>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Marc Dionne <marc.dionne@auristor.com>, linux-afs@lists.infradead.org,
	Shyam Prasad N <nspmangalore@gmail.com>, CIFS <linux-cifs@vger.kernel.org>,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	Jeff Layton <jlayton@kernel.com>, linux-cachefs@redhat.com,
	Trond Myklebust <trondmy@hammerspace.com>,
	v9fs-developer@lists.sourceforge.net,
	Alexander Viro <viro@zeniv.linux.org.uk>, ceph-devel@vger.kernel.org,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	"open list:NFS, SUNRPC, AND..." <linux-nfs@vger.kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Steve French <sfrench@samba.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Omar Sandoval <osandov@osandov.com>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH v2 00/53] fscache: Rewrite index API and
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Oct 22, 2021 at 9:40 AM David Howells <dhowells@redhat.com> wrote:
>
> What's the best way to do this?  Is it fine to disable caching in all the
> network filesystems and then directly remove the fscache and cachefiles
> drivers and replace them?

So the basic issue with this whole "total rewrite" is that there's no
way to bisect anything.

And there's no way for people to say "I don't trust the rewrite, I
want to keep using the old tested model".

Which makes this all painful and generally the wrong way to do
anything like this, and there's fundamentally no "best way".

The real best way would be if the conversion could be done truly
incrementally. Flag-days simply aren't good for development, because
even if the patch to enable the new code might be some trivial
one-liner, that doesn't _help_ anything. The switch-over switches from
one code-base to another, with no help from "this is where the problem
started".

So in order of preference:

 (a) actual incremental changes where the code keeps working all the
time, and no flag days

 (b) same interfaces, so at least you can do A/B testing and people
can choose one or the other

 (c) total rewrite

and if (c) is the thing that all the network filesystem people want,
then what the heck is the point in keeping dead code around? At that
point, all the rename crap is just extra work, extra noise, and only a
distraction. There's no upside that I can see.

                   Linus

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

