Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9A8636E27
	for <lists+linux-cachefs@lfdr.de>; Thu, 24 Nov 2022 00:12:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669245138;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6d2WuP11QagxpXJMHVtc+uDIsM/WEDuto+GVXfJdIlk=;
	b=FPTy25RlzhDSjtbdP83t147v10Ysf1VJglelh0HQt6+V//yTYh4UeoP77+UEMcvdJPUUCp
	UwSIkuvEqeAbXMu4wVE8r/C/VRG1XnMJaRc0r288I2p56wymfs+P9oq+FtApkhObKSQMJ6
	JWiMsRMUv1pEpBxXHbzRNpf8M1SPcUU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-FNhXw1yCP2uClscGJ0GNzA-1; Wed, 23 Nov 2022 18:12:15 -0500
X-MC-Unique: FNhXw1yCP2uClscGJ0GNzA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9880A380407E;
	Wed, 23 Nov 2022 23:12:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 736461415114;
	Wed, 23 Nov 2022 23:12:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4CD6C194658D;
	Wed, 23 Nov 2022 23:12:14 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BB53C1946587 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 23 Nov 2022 23:12:12 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 998CD1400B15; Wed, 23 Nov 2022 23:12:12 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 69F811402BDA;
 Wed, 23 Nov 2022 23:12:10 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CAHk-=wjq7gRdVUrwpQvEN1+um+hTkW8dZZATtfFS-fp9nNssRw@mail.gmail.com>
References: <CAHk-=wjq7gRdVUrwpQvEN1+um+hTkW8dZZATtfFS-fp9nNssRw@mail.gmail.com>
 <166924370539.1772793.13730698360771821317.stgit@warthog.procyon.org.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
MIME-Version: 1.0
Date: Wed, 23 Nov 2022 23:12:07 +0000
Message-ID: <1774227.1669245127@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [Linux-cachefs] [PATCH v4 0/3] mm, netfs,
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
 linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-afs@lists.infradead.org, linux-mm@kvack.org, linux-cachefs@redhat.com,
 Steve French <sfrench@samba.org>, v9fs-developer@lists.sourceforge.net,
 Ilya Dryomov <idryomov@gmail.com>, linux-erofs@lists.ozlabs.org,
 Dominique Martinet <asmadeus@codewreck.org>, Jeff Layton <jlayton@kernel.org>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <1774226.1669245127.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Linus Torvalds <torvalds@linux-foundation.org> wrote:

> Well, the patches look superficially cleaner to me, at least. That
> "doesn't seem to be necessary" makes me a bit worried,

I meant that it doesn't cause a splat to appear in dmesg saying that an
unexpected flag was left set.

David
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

