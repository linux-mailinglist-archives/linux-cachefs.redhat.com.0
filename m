Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF54477909
	for <lists+linux-cachefs@lfdr.de>; Thu, 16 Dec 2021 17:29:06 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-322-C5b9PQXBPTOTplZCP1EArQ-1; Thu, 16 Dec 2021 11:28:56 -0500
X-MC-Unique: C5b9PQXBPTOTplZCP1EArQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE52510766D8;
	Thu, 16 Dec 2021 16:28:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DFA965ED2C;
	Thu, 16 Dec 2021 16:28:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A2F621806D1C;
	Thu, 16 Dec 2021 16:28:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
	[10.11.54.10])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BGGSBQs008828 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 16 Dec 2021 11:28:11 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C4DFB46CFCD; Thu, 16 Dec 2021 16:28:11 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C119546CFC7
	for <linux-cachefs@redhat.com>; Thu, 16 Dec 2021 16:28:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A56FD3D2CE86
	for <linux-cachefs@redhat.com>; Thu, 16 Dec 2021 16:28:11 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
	[209.85.208.42]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-377-CuZeK04RMg-ktxrWrnI5Yg-1; Thu, 16 Dec 2021 11:28:09 -0500
X-MC-Unique: CuZeK04RMg-ktxrWrnI5Yg-1
Received: by mail-ed1-f42.google.com with SMTP id o20so89343269eds.10
	for <linux-cachefs@redhat.com>; Thu, 16 Dec 2021 08:28:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fkh9SA21WJAwLXrex3D5hDMvc6XDF8J0dz4irJ+Ae9Y=;
	b=CSxtHb7Z+34E0F/BB8S9C8gl+EX2Gn+FK/OfEP3SUwO+XYcMS52VoK4uKAbiB2eTsB
	o0Gi0FJ335IIXRhJRKmQhF6AYZFBMtgk51mEs9oj1FJUgmoJep5G6211XzFlwjySOPRz
	etkspSiI7b7Nd1kUbZdm59CaUENl/8K61VwH5UUpwOX08UUnaVE0QIzFvlcRYdEtr49f
	GtvmBpfSgr7CeWDj84lA+uF03wdY00bDRKQfmu4wT18XXRnVnmmmX6+PnshYKeD9XJKu
	CS2aQjhL2ofm1IqmKFEbh0gncfjoh6PgCdLXBfZLBrK2D0JTpXTPvOZNCLXqtTQAYr1t
	yTag==
X-Gm-Message-State: AOAM533Ng18j+ngRqqX05T8deNRYZS/tIoD1PM3mDnBbC4+BvpOeerWF
	YGp7AJFNwRaZ5GnM58s2AXjwVwsbfnQ5x4E2
X-Google-Smtp-Source: ABdhPJwugM4VnPIGx8TIu/PhZ4/UaikZ5z23ZVwlFlSeLUezMgKmg9plaA3zDakbHsSQfXlnhGmifA==
X-Received: by 2002:a17:906:cec5:: with SMTP id
	si5mr3617773ejb.17.1639672087977; 
	Thu, 16 Dec 2021 08:28:07 -0800 (PST)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com.
	[209.85.221.47]) by smtp.gmail.com with ESMTPSA id
	u14sm1911213edv.92.2021.12.16.08.28.06 for <linux-cachefs@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 16 Dec 2021 08:28:06 -0800 (PST)
Received: by mail-wr1-f47.google.com with SMTP id c4so45179155wrd.9
	for <linux-cachefs@redhat.com>; Thu, 16 Dec 2021 08:28:06 -0800 (PST)
X-Received: by 2002:a5d:6211:: with SMTP id y17mr9727999wru.97.1639672086343; 
	Thu, 16 Dec 2021 08:28:06 -0800 (PST)
MIME-Version: 1.0
References: <163967073889.1823006.12237147297060239168.stgit@warthog.procyon.org.uk>
	<163967172373.1823006.6118195970180365070.stgit@warthog.procyon.org.uk>
In-Reply-To: <163967172373.1823006.6118195970180365070.stgit@warthog.procyon.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 16 Dec 2021 08:27:50 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjiba2VRKKjOYAiCZn1Tk9H1tiXcOvjekdo3wPHHmedyQ@mail.gmail.com>
Message-ID: <CAHk-=wjiba2VRKKjOYAiCZn1Tk9H1tiXcOvjekdo3wPHHmedyQ@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-loop: linux-cachefs@redhat.com
Cc: CIFS <linux-cifs@vger.kernel.org>, "open list:NFS, SUNRPC,
	AND..." <linux-nfs@vger.kernel.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Jeff Layton <jlayton@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Steve French <sfrench@samba.org>, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	ceph-devel@vger.kernel.org, Omar Sandoval <osandov@osandov.com>,
	linux-afs@lists.infradead.org, v9fs-developer@lists.sourceforge.net
Subject: Re: [Linux-cachefs] [PATCH v3 57/68] afs: Fix afs_write_end() to
	handle len > page size
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

On Thu, Dec 16, 2021 at 8:22 AM David Howells <dhowells@redhat.com> wrote:
>
> It is possible for the len argument to afs_write_end() to overrun the end
> of the page (len is used to key the size of the page in afs_write_start()
> when compound pages become a regular thing).

This smells like a bug in the caller.

It's just insane to call "write_end()" with a range that doesn't
actually fit in the page provided.

Exactly how does that happen, and why should AFS deal with it, not
whoever called write_end()?

              Linus

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

