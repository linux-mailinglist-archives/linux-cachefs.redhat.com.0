Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 699A959FAC7
	for <lists+linux-cachefs@lfdr.de>; Wed, 24 Aug 2022 15:02:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661346131;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=t+XQIZs2lDfAB1Usp6UoMq7YkEENmrQOitCOQMAOZO0=;
	b=Xxx90Kbo1q+VagXetwetS5ddCS8A5hUZH/9i4CphE6yAUFcWWfPP4JJMDCNpJt/VPEuV2Z
	kv2jbRK0MYPE31sbGPQDXYRzPONiqc1XqqmsSnnZiJCkOIeTlWZEprO2+eKF0wu3VORQJH
	QYQxEAZeGOxPAyImvRFzh2rmNyKYXj8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-0WEB3aaQORm12Net2dfJgg-1; Wed, 24 Aug 2022 09:02:08 -0400
X-MC-Unique: 0WEB3aaQORm12Net2dfJgg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 82BEB8039B2;
	Wed, 24 Aug 2022 13:02:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BC0434010D2A;
	Wed, 24 Aug 2022 13:02:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BDBED1946A58;
	Wed, 24 Aug 2022 13:02:04 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id AA0A61946A47 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 24 Aug 2022 12:23:16 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 70A50C15BBD; Wed, 24 Aug 2022 12:23:16 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7BC7AC15BB3;
 Wed, 24 Aug 2022 12:23:15 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <000000000000d082f105e6f93705@google.com>
References: <000000000000d082f105e6f93705@google.com>
To: syzbot <syzbot+5b129e8586277719bab3@syzkaller.appspotmail.com>
MIME-Version: 1.0
Date: Wed, 24 Aug 2022 13:23:14 +0100
Message-ID: <4020341.1661343794@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: Re: [Linux-cachefs] [syzbot] general protection fault in
 fscache_free_cookie
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
Cc: linux-cachefs-owner@redhat.com, linux-cachefs-bounces@redhat.com,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 mudongliangabcd@gmail.com, linux-cachefs@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <4020340.1661343794.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

syzbot <syzbot+5b129e8586277719bab3@syzkaller.appspotmail.com> wrote:

> This bug is marked as fixed by commit:
> fscache: fix GPF in fscache_free_cookie

The code that was buggy got entirely removed and rewritten, so the fix is
obsolete.  How do I communicate that to syzbot?

David
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

