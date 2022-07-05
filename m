Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F5C566F18
	for <lists+linux-cachefs@lfdr.de>; Tue,  5 Jul 2022 15:21:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657027292;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SD7XUKRJ57FR6klt1jbt+KH7y/vgsg4f4aXWpDwCWFY=;
	b=TTHtuANtGYyazUIrOJWd8b8X4NQBMvshUbX3fpncZj+7Ku6RcHormP4mwzS7Ok/Efbe9Ax
	j4wRlCH8/b1MlGGLtl2Khgq8hhXqG2zcWCwZCSkQWPRCjLVSNN62UXqtpMfNQUvQF/ds7w
	slkFlEH8z5kJ1AzSBvMi/veqBPeP22A=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-491-rBIxeQjuPCKPhCVfHPXY1Q-1; Tue, 05 Jul 2022 09:21:29 -0400
X-MC-Unique: rBIxeQjuPCKPhCVfHPXY1Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C38D71C004E5;
	Tue,  5 Jul 2022 13:21:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A057740336E;
	Tue,  5 Jul 2022 13:21:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 353601947056;
	Tue,  5 Jul 2022 13:21:27 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1571F1947057 for <linux-cachefs@listman.corp.redhat.com>;
 Tue,  5 Jul 2022 13:21:26 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0896E417E5B; Tue,  5 Jul 2022 13:21:26 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.37.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BCF03416390;
 Tue,  5 Jul 2022 13:21:24 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <30a4bd0e19626f5fb30f19f0ae70fba2debb361a.camel@kernel.org>
References: <30a4bd0e19626f5fb30f19f0ae70fba2debb361a.camel@kernel.org>
 <20220701022947.10716-1-xiubli@redhat.com>
 <20220701022947.10716-2-xiubli@redhat.com>
To: Jeff Layton <jlayton@kernel.org>
MIME-Version: 1.0
Date: Tue, 05 Jul 2022 14:21:24 +0100
Message-ID: <2187946.1657027284@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: Re: [Linux-cachefs] [PATCH 1/2] netfs: release the folio lock and
 put the folio before retrying
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
Cc: keescook@chromium.org, linux-kernel@vger.kernel.org, willy@infradead.org,
 linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org, idryomov@gmail.com,
 ceph-devel@vger.kernel.org, vshankar@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <2187945.1657027284.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Jeff Layton <jlayton@kernel.org> wrote:

> I don't know here... I think it might be better to just expect that when
> this function returns an error that the folio has already been unlocked.
> Doing it this way will mean that you will lock and unlock the folio a
> second time for no reason.

I seem to remember there was some reason you wanted the folio unlocking and
putting.  I guess you need to drop the ref to flush it.

Would it make sense for ->check_write_begin() to be passed a "struct folio
**folio" rather than "struct folio *folio" and then the filesystem can clear
*folio if it disposes of the page?

David
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

