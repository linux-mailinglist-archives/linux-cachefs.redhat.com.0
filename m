Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0A52836E73F
	for <lists+linux-cachefs@lfdr.de>; Thu, 29 Apr 2021 10:45:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1619685938;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=euDp/T0017EezSxsiBw18SgqMTjpxYKHZzQh7lpTLws=;
	b=gghE1UlpTan4RnDSAMlbi6deq6cWgjtDuTgqZkeBSA45kg4hY60tTxh3U44j+d2c8xCxxY
	q8Fa+X+1CG9DhvbOd12dRdWLBpFBGhgkM2VarltEfH/S4mTSIcpQiTcKRt3azhWe/sm8g5
	LK6H6G6GafEq8bVbjWBMpHWxHEioc40=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-8UIKiEd5OEa2u91XZ2BSEA-1; Thu, 29 Apr 2021 04:45:36 -0400
X-MC-Unique: 8UIKiEd5OEa2u91XZ2BSEA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A00188014C1;
	Thu, 29 Apr 2021 08:45:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 59F4867882;
	Thu, 29 Apr 2021 08:45:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1038D1806D06;
	Thu, 29 Apr 2021 08:45:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13T8fj66001219 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 29 Apr 2021 04:41:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 69C6961169; Thu, 29 Apr 2021 08:41:45 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-20.rdu2.redhat.com
	[10.10.112.20])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 928387012B;
	Thu, 29 Apr 2021 08:41:38 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CAMuHMdXJZ7iNQE964CdBOU=vRKVMFzo=YF_eiwsGgqzuvZ+TuA@mail.gmail.com>
References: <CAMuHMdXJZ7iNQE964CdBOU=vRKVMFzo=YF_eiwsGgqzuvZ+TuA@mail.gmail.com>
	<161918446704.3145707.14418606303992174310.stgit@warthog.procyon.org.uk>
	<161918455721.3145707.4063925145568978308.stgit@warthog.procyon.org.uk>
To: Geert Uytterhoeven <geert@linux-m68k.org>
MIME-Version: 1.0
Date: Thu, 29 Apr 2021 09:41:37 +0100
Message-ID: <442393.1619685697@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, "open list:NFS,
	SUNRPC, AND..." <linux-nfs@vger.kernel.org>,
	Linux MM <linux-mm@kvack.org>, Steve French <sfrench@samba.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Marc Dionne <marc.dionne@auristor.com>, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Linux FS Devel <linux-fsdevel@vger.kernel.org>,
	V9FS Developers <v9fs-developer@lists.sourceforge.net>,
	ceph-devel <ceph-devel@vger.kernel.org>, linux-afs@lists.infradead.org,
	Dominique Martinet <asmadeus@codewreck.org>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <442392.1619685697.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> I see later patches make AFS and FSCACHE select NETFS_SUPPORT.  If this
> is just a library of functions, to be selected by its users, then please
> make the symbol invisible.

Ideally, yes, it would be an invisible symbol enabled by select from the
network filesystems that use it - but doing that means that you can't choose
whether to build it in or build it as a module.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

