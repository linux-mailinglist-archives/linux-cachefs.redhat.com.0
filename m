Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A55E14E190B
	for <lists+linux-cachefs@lfdr.de>; Sun, 20 Mar 2022 00:47:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647733677;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=v27XU7Jy10uiZsEDM2HmGDRxzLEuYjMGwiN1pffk7Z0=;
	b=BFfc2aCAD/eTEKokHhoOhzvqVqVJJzaETiupW0zi5kWWQEZ2ffzTotPtR7F2x8f7NHlw54
	v3HrodIX8EzkTs6UYNSr352DyCm8EfzHGvOnHi412wEvJdjiqMj62vhxnucISCQIEuGS3+
	Ka8vFqvNdwKWg7SVUponw4hExLHs5lM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-i9pCbx0GNqKqONwlK5duVg-1; Sat, 19 Mar 2022 19:47:54 -0400
X-MC-Unique: i9pCbx0GNqKqONwlK5duVg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B91298001EA;
	Sat, 19 Mar 2022 23:47:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C36921427B16;
	Sat, 19 Mar 2022 23:47:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 54A6E1953557;
	Sat, 19 Mar 2022 23:47:49 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5E2A01953549 for <linux-cachefs@listman.corp.redhat.com>;
 Sat, 19 Mar 2022 23:47:47 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2A08640CF8F6; Sat, 19 Mar 2022 23:47:47 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7E10C40CF8F2;
 Sat, 19 Mar 2022 23:47:45 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CAOi1vP_sEj7i8YbbwJibbSG=BCVp4E9BAo=JF0aC79xBNC8wcA@mail.gmail.com>
References: <CAOi1vP_sEj7i8YbbwJibbSG=BCVp4E9BAo=JF0aC79xBNC8wcA@mail.gmail.com>
 <751829.1647648125@warthog.procyon.org.uk>
To: Ilya Dryomov <idryomov@gmail.com>
MIME-Version: 1.0
Date: Sat, 19 Mar 2022 23:47:44 +0000
Message-ID: <824348.1647733664@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: Re: [Linux-cachefs] Coordinating netfslib pull request with the
 ceph pull request
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
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
 Jeff Layton <jlayton@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-cachefs@redhat.com, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 v9fs-developer@lists.sourceforge.net,
 Ceph Development <ceph-devel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-afs@lists.infradead.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <824347.1647733664.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Ilya Dryomov <idryomov@gmail.com> wrote:

> Given how your branch is structured, it sounds like the easiest would
> be for you to send the netfslib pull request after I send the ceph pull
> request.  Or do you have some tighter coordination in mind?

I think that's sufficient - or if I sent mine first, I can put in a big note
at the top saying it depends on yours, when you decide to post it.

David
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

