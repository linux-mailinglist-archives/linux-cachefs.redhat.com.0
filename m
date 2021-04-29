Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6A72B36E67E
	for <lists+linux-cachefs@lfdr.de>; Thu, 29 Apr 2021 10:05:19 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499--quwitSGNNuZFJj-G-59Jg-1; Thu, 29 Apr 2021 04:05:16 -0400
X-MC-Unique: -quwitSGNNuZFJj-G-59Jg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9D77107ACC7;
	Thu, 29 Apr 2021 08:05:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E00E41002D71;
	Thu, 29 Apr 2021 08:05:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3662D44A5C;
	Thu, 29 Apr 2021 08:05:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13T8534H030301 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 29 Apr 2021 04:05:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7BA6920962EF; Thu, 29 Apr 2021 08:05:03 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7738820962EA
	for <linux-cachefs@redhat.com>; Thu, 29 Apr 2021 08:05:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2485B857A81
	for <linux-cachefs@redhat.com>; Thu, 29 Apr 2021 08:05:01 +0000 (UTC)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com
	[209.85.217.53]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-289-LV_HLWf2NNKtwMlAr98ohQ-1; Thu, 29 Apr 2021 04:04:58 -0400
X-MC-Unique: LV_HLWf2NNKtwMlAr98ohQ-1
Received: by mail-vs1-f53.google.com with SMTP id 66so33248318vsk.9;
	Thu, 29 Apr 2021 01:04:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=cEaWsqveglqKutwIfCWg/c1k8Pjc9F7AASjTBk3kAB0=;
	b=klH1Fjl46qtlEtYEZ9fYtb197kLclqVgal6VoabWG9f6vLVIqrns/lqVdNCJ9PJGVs
	Zh4dAWXrGEC31rqXc1wS/2rnqkkO0uRkyAIb6ZUbMUTxg66phpSde02H8U2UaSX9DXeS
	x+xcVFfWFoF3/3s9jBGF47RI3HIqhZUeeQoR3i4HIvMDSabZUTISv9s8qNqjaqoBIVgC
	cyCeMydEN0O2nRcJAnfVqDuLtisZg+SuP9bvCe/LkNvaQuDEO8S38yQWarFi9fkeB6rP
	0bjcspr5w59CJnhvWyr9O0k4ahC5KkVbk2Ae90bSx3ZPc9rQi/10wwYP1vub4tcVyb1i
	i/Yg==
X-Gm-Message-State: AOAM533R/QH1mtNeeplaYiDCB5RQSjkBoLAlXei0OPb3WlqWBI5ESZs7
	v8hXmDMJ/x3nX9ervZIA8STmcOKWmJ7PMG6MEPylIJwGMG4=
X-Google-Smtp-Source: ABdhPJyOQfCSFL6ivPQSvopdsprRnA2n+Ja7fwwMwXAF5cOL+2KKLY+oOwM93GwYMJWOqvFowThQ0q/7iQPRdk2pFdw=
X-Received: by 2002:a67:fc57:: with SMTP id p23mr29422049vsq.40.1619683497839; 
	Thu, 29 Apr 2021 01:04:57 -0700 (PDT)
MIME-Version: 1.0
References: <161918446704.3145707.14418606303992174310.stgit@warthog.procyon.org.uk>
	<161918455721.3145707.4063925145568978308.stgit@warthog.procyon.org.uk>
In-Reply-To: <161918455721.3145707.4063925145568978308.stgit@warthog.procyon.org.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 29 Apr 2021 10:04:46 +0200
Message-ID: <CAMuHMdXJZ7iNQE964CdBOU=vRKVMFzo=YF_eiwsGgqzuvZ+TuA@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, "open list:NFS, SUNRPC,
	AND..." <linux-nfs@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Steve French <sfrench@samba.org>,
	Marc Dionne <marc.dionne@auristor.com>, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Linux FS Devel <linux-fsdevel@vger.kernel.org>,
	V9FS Developers <v9fs-developer@lists.sourceforge.net>,
	ceph-devel <ceph-devel@vger.kernel.org>, linux-afs@lists.infradead.org
Subject: Re: [Linux-cachefs] [PATCH v7 07/31] netfs: Make a netfs helper
	module
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

Hi David,

On Fri, Apr 23, 2021 at 3:31 PM David Howells <dhowells@redhat.com> wrote:
> Make a netfs helper module to manage read request segmentation, caching
> support and transparent huge page support on behalf of a network
> filesystem.
>
> Signed-off-by: David Howells <dhowells@redhat.com>

Thanks for your patch, which is now commit 3ca236440126f75c ("mm:
Implement readahead_control pageset expansion") upstream.

> --- /dev/null
> +++ b/fs/netfs/Kconfig
> @@ -0,0 +1,8 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config NETFS_SUPPORT
> +       tristate "Support for network filesystem high-level I/O"
> +       help
> +         This option enables support for network filesystems, including
> +         helpers for high-level buffered I/O, abstracting out read
> +         segmentation, local caching and transparent huge page support.

TBH, this help text didn't give me any clue on whether I want to enable
this config option or not.  Do I need it for e.g. NFS, which is a
network filesystem?

I see later patches make AFS and FSCACHE select NETFS_SUPPORT.  If this
is just a library of functions, to be selected by its users, then please
make the symbol invisible.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

