Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDA350741B
	for <lists+linux-cachefs@lfdr.de>; Tue, 19 Apr 2022 18:47:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1650386829;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FffRleqUpVjhBcvS5CYH3Maibq93W0Q6mDw3Uqvap0g=;
	b=XMy+L3SHm1jzyRwoga2uXWYkfbXrsy3oEPBi/UwGMIvCbMrlVJUG35PMxtNB1YOhxMzYtg
	9RDdL5QMgz3Os34Ab+/UYqURjlx2lZZT4HIWNPO6w7ldalv9rJ6NPBR+oBg21KWjzgkR69
	A3tNwrNu/NlMkTS/fcRxrcHVn3XP0ts=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-66-UiMVqLyyO_CtHIm0bAndrg-1; Tue, 19 Apr 2022 12:47:05 -0400
X-MC-Unique: UiMVqLyyO_CtHIm0bAndrg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B47F1C01706;
	Tue, 19 Apr 2022 16:47:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 911D940E80E0;
	Tue, 19 Apr 2022 16:47:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D820D1940342;
	Tue, 19 Apr 2022 16:47:03 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 59A751949761 for <linux-cachefs@listman.corp.redhat.com>;
 Tue, 19 Apr 2022 16:47:03 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 347D540E80F4; Tue, 19 Apr 2022 16:47:03 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7B4A740E80E0;
 Tue, 19 Apr 2022 16:47:02 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <Yl7mQr05hPg4vELb@rabbit.intern.cm-ag>
References: <Yl7mQr05hPg4vELb@rabbit.intern.cm-ag>
 <Yl7EyMLnqqDv63yW@rabbit.intern.cm-ag> <YlWWbpW5Foynjllo@rabbit.intern.cm-ag>
 <454834.1650373340@warthog.procyon.org.uk>
 <508603.1650385022@warthog.procyon.org.uk>
To: Max Kellermann <mk@cm4all.com>
MIME-Version: 1.0
Date: Tue, 19 Apr 2022 17:47:01 +0100
Message-ID: <510136.1650386821@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: Re: [Linux-cachefs] fscache corruption in Linux 5.17?
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
Cc: linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com,
 linux-kernel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <510135.1650386821.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Max Kellermann <mk@cm4all.com> wrote:

> I don't think any write is misaligned.  This was triggered by a
> WordPress update, so I think the WordPress updater truncated and
> rewrote all files.  Random guess: some pages got transferred to the
> NFS server, but the local copy in fscache did not get updated.

Do the NFS servers change the files that are being served - or is it just
WordPress pushing the changes to the NFS servers for the web servers to then
export?

David
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

