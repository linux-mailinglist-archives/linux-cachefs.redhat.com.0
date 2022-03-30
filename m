Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 193D84EC8E8
	for <lists+linux-cachefs@lfdr.de>; Wed, 30 Mar 2022 17:56:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1648655763;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6rpxvUpovu0+7x3xq++HStBiN5vlpFnDOwRzEzGZIm4=;
	b=XraNFeW8uTMOPEM9whtolgUv1TiGhaUNpesucOzEg8QnAV/XYRnRbfDbaLy5rLB3F7rWZC
	T2a/yQfP9dsDYN+dh97+Hclxnb48cYwO0kGUznS6PrzXrWzp89kZJR77UgAynuzVkGVTZJ
	nruEv6ebimW2hlUlV4SO9MHefG70ESI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-373-AAuAWCjNOsO5nPT1-WaGIQ-1; Wed, 30 Mar 2022 11:55:59 -0400
X-MC-Unique: AAuAWCjNOsO5nPT1-WaGIQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2742480378F;
	Wed, 30 Mar 2022 15:55:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D73E0401E39;
	Wed, 30 Mar 2022 15:55:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9557A1947BBD;
	Wed, 30 Mar 2022 15:55:58 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DEBEC19451F3 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 30 Mar 2022 15:55:57 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B1F21141DECD; Wed, 30 Mar 2022 15:55:57 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3C61E1400C2C;
 Wed, 30 Mar 2022 15:55:57 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CAAmbk-f4_mft=bLWPuHEzzpCiL4ikgkNvtCAWq_rd3=BQPzMJw@mail.gmail.com>
References: <CAAmbk-f4_mft=bLWPuHEzzpCiL4ikgkNvtCAWq_rd3=BQPzMJw@mail.gmail.com>
 <CAAmbk-egCMVm0s8P8y455HF7cWyReC0cjnQEkDuLFeoEqhTRVw@mail.gmail.com>
 <2923709.1648636080@warthog.procyon.org.uk>
To: Chris Chilvers <chilversc@gmail.com>
MIME-Version: 1.0
Date: Wed, 30 Mar 2022 16:55:56 +0100
Message-ID: <2997201.1648655756@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: Re: [Linux-cachefs] [BUG] write but no read when using sync mount
 option
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
Cc: linux-cachefs@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <2997200.1648655756.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Chris Chilvers <chilversc@gmail.com> wrote:

> File system was ext4 on a separate drive specificlly for fs-cache mounted on
> /var/cache/fscache.

I meant which network filesystem.

David
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

