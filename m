Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B95636B16
	for <lists+linux-cachefs@lfdr.de>; Wed, 23 Nov 2022 21:26:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669235182;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iEFOo/Bc5g5NJxV4IccJcGto+3r/L0aN0XUYqERwkvc=;
	b=dLZ8DNiciqhcejZUaZC6GJ1YpJkNefXMkQBbu6nnwiPMrChgc47WNEwAatXEWOyiOTZ+eZ
	5G0L/LlNudXU8mYHpsW3l61XIzEBaoTa7ENbolJh15Gp9HTuALsl5y9FKnPid9gbkXitlR
	pxlrmpdzCKA4wdAf0qe1D8aQDaRVtLE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-332-3yK4wOmwOH-yN27OG2vhHg-1; Wed, 23 Nov 2022 15:26:19 -0500
X-MC-Unique: 3yK4wOmwOH-yN27OG2vhHg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B00203C0ED43;
	Wed, 23 Nov 2022 20:26:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A68152166B26;
	Wed, 23 Nov 2022 20:26:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7220F194658D;
	Wed, 23 Nov 2022 20:26:18 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 52B1C1946587 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 23 Nov 2022 20:26:17 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 43A33C15995; Wed, 23 Nov 2022 20:26:17 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 369BAC15BA5
 for <linux-cachefs@redhat.com>; Wed, 23 Nov 2022 20:26:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1B6DF8339B4
 for <linux-cachefs@redhat.com>; Wed, 23 Nov 2022 20:26:17 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-327-RFPGcyLeOVS_MowWBBx3Ew-1; Wed, 23 Nov 2022 15:26:15 -0500
X-MC-Unique: RFPGcyLeOVS_MowWBBx3Ew-1
Received: by mail-qk1-f179.google.com with SMTP id x21so13309261qkj.0
 for <linux-cachefs@redhat.com>; Wed, 23 Nov 2022 12:26:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CqmvkkESPfhDMe/qDmW4BJUOiTicPIv5an9zs8Gyv18=;
 b=SIIwVQpxJqluy2w+QDtMyA1LBCO02HgJefJ6cTxQmWLJ3S+6alo9gKD/pS3dIB5BOM
 s2Fm5fYYmGJbm55C/Rw91R9A0wFE6qjW1NWCJVWvks6bq32c5SRXJS6RcZyjr+olVLP0
 8zdQFilQEKFoqrYMDX2+bFhjvxrV7pY/8aqYYWl48NMj8HU15hkDD475hqY8L3QEnSjg
 8J5KUXlEBX7WD3EOv48+4f5ZSTAV3Wn7ESV1ZLHczje13PHuYEMPWv6nzF8D2ZKioddA
 HyIbuilRcTZ8wC5iZGvjT4M1t1tuaVy6XHk+nRLYbTVZDnK/7taylHi1cH67uhaw2q8d
 1oVw==
X-Gm-Message-State: ANoB5pmrXyhGqUxLNBurZj06LG9QPY5ul686jw4anU0IOeWQdP8HpA7y
 9UJcoiYomTeRLdCj9MufND9qdGpWNP0yaA==
X-Google-Smtp-Source: AA0mqf63MqB80pCEodyfzDeH5N6tOCP0Ulw8KuJHhxA5ge+n7f+ujU8cXcqWQBUx039kQDSF58mtaA==
X-Received: by 2002:a05:620a:6d3:b0:6fa:769b:8d8d with SMTP id
 19-20020a05620a06d300b006fa769b8d8dmr13900325qky.188.1669235173935; 
 Wed, 23 Nov 2022 12:26:13 -0800 (PST)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com.
 [209.85.219.50]) by smtp.gmail.com with ESMTPSA id
 m20-20020a05620a24d400b006b949afa980sm13173286qkn.56.2022.11.23.12.26.12
 for <linux-cachefs@redhat.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Nov 2022 12:26:13 -0800 (PST)
Received: by mail-qv1-f50.google.com with SMTP id j6so12889223qvn.12
 for <linux-cachefs@redhat.com>; Wed, 23 Nov 2022 12:26:12 -0800 (PST)
X-Received: by 2002:ad4:4101:0:b0:4b1:856b:4277 with SMTP id
 i1-20020ad44101000000b004b1856b4277mr10112261qvp.129.1669235172559; Wed, 23
 Nov 2022 12:26:12 -0800 (PST)
MIME-Version: 1.0
References: <1459152.1669208550@warthog.procyon.org.uk>
 <CAHk-=wghJtq-952e_8jd=vtV68y_HsDJ8=e0=C3-AsU2WL-8YA@mail.gmail.com>
 <1619343.1669233783@warthog.procyon.org.uk>
In-Reply-To: <1619343.1669233783@warthog.procyon.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 23 Nov 2022 12:25:56 -0800
X-Gmail-Original-Message-ID: <CAHk-=whJBOAOqB8wWxeAtKy3b9r4rn2Y48+zsuDDhKJ3D3D4cw@mail.gmail.com>
Message-ID: <CAHk-=whJBOAOqB8wWxeAtKy3b9r4rn2Y48+zsuDDhKJ3D3D4cw@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: Re: [Linux-cachefs] [PATCH v3] mm, netfs,
 fscache: Stop read optimisation when folio removed from pagecache
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: Shyam Prasad N <nspmangalore@gmail.com>, linux-cifs@vger.kernel.org,
 linux-nfs@vger.kernel.org, Rohith Surabattula <rohiths.msft@gmail.com>,
 ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org, willy@infradead.org,
 linux-afs@lists.infradead.org, Steve French <sfrench@samba.org>,
 linux-mm@kvack.org, linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org,
 v9fs-developer@lists.sourceforge.net, Ilya Dryomov <idryomov@gmail.com>,
 Dominique Martinet <asmadeus@codewreck.org>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Nov 23, 2022 at 12:03 PM David Howells <dhowells@redhat.com> wrote:
>
> Linus Torvalds <torvalds@linux-foundation.org> wrote:
>
> > But I also think it's strange in another way, with that odd placement of
> >
> >         mapping_clear_release_always(inode->i_mapping);
> >
> > at inode eviction time. That just feels very random.
>
> I was under the impression that a warning got splashed if unexpected
> address_space flags were set when ->evict_inode() returned.  I may be thinking
> of page flags.  If it doesn't, fine, this isn't required.

I don't know if the warning happens or not, but the thing I reacted to
was just how *random* this was. There was no logic to it, nor any
explanation.

I *suspect* that if we add this kind of new generic address space
flag, then that flag should just be cleared by generic code when the
address space is released.

But I'm not saying it has to be done that way - I'm just saying that
however it is done, please don't make it this random mess with no
explanation.

The *setting* of the flag was at least fairly obvious. I didn't find
code like this odd:

+       if (v9inode->netfs.cache)
+               mapping_set_release_always(inode->i_mapping);

and it makes all kinds of sense (ie I can read it as a "if I use netfs
caching for this inode, then I want to be informed when a folio is
released from this mapping").

It's just the clearing that looked very random to me.

Maybe just a comment would have helped, but I get the feeling that it
migth as well just be cleared in "clear_inode()" or something like
that.

> > That code makes no sense what-so-ever. Why isn't it using
> > "folio_has_private()"?
>
> It should be, yes.
>
> > Why is this done as an open-coded - and *badly* so - version of
> > !folio_needs_release() that you for some reason made private to mm/vmscan.c?
>
> Yeah, in retrospect, I should have put that in mm/internal.h.

So if folio_needs_release() is in mm/internal.h, and then mm/filemap.c
uses it in filemap_release_folio() instead of the odd open-coding, I
think that would clear up my worries about both mm/filemap.c and
mm/vmscan.c.

                Linus

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

