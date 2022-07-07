Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5F756A26F
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Jul 2022 14:52:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657198360;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qKGXlO5RZLKLRabYA0fmPJZDdFjUzbHH4KH7aN+d9kY=;
	b=hLzcryXUn56HfWD+AsR0BqJjyBhSP01wLnqTA4NVwkBu6lqWc69IuGN6igEmpYXV6raQUH
	9ySE0ldr6TzbaH9W8UcBE3bJJRI1hzZGTPUxWBsVbojEollS6L/68OzXSp3E3I5v7DdcT+
	d3UwrMH72MR4HKQxSYIsyJ33RTnwX0s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-52-BuOuVrLXP7CkYDxreBLWyg-1; Thu, 07 Jul 2022 08:52:32 -0400
X-MC-Unique: BuOuVrLXP7CkYDxreBLWyg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 87E32811E83;
	Thu,  7 Jul 2022 12:52:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7E64E2EF97;
	Thu,  7 Jul 2022 12:52:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 345C2194706C;
	Thu,  7 Jul 2022 12:52:31 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id F3D021947069 for <linux-cachefs@listman.corp.redhat.com>;
 Thu,  7 Jul 2022 12:52:29 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E510D202699A; Thu,  7 Jul 2022 12:52:29 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.37.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3C8E62026D64;
 Thu,  7 Jul 2022 12:52:28 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <f60dacead3da4ab78edd225749d698f8e621f577.camel@kernel.org>
References: <f60dacead3da4ab78edd225749d698f8e621f577.camel@kernel.org>
 <20220707045112.10177-1-xiubli@redhat.com>
 <20220707045112.10177-3-xiubli@redhat.com>
To: Jeff Layton <jlayton@kernel.org>
MIME-Version: 1.0
Date: Thu, 07 Jul 2022 13:52:27 +0100
Message-ID: <2433377.1657198347@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: Re: [Linux-cachefs] [PATCH v3 2/2] afs: unlock the folio when vnode
 is marked deleted
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
Cc: keescook@chromium.org, ceph-devel@vger.kernel.org,
 linux-kernel@vger.kernel.org, willy@infradead.org,
 william.kucharski@oracle.com, linux-cachefs@redhat.com, vshankar@redhat.com,
 marc.dionne@auristor.com, idryomov@gmail.com, linux-afs@lists.infradead.org,
 kirill.shutemov@linux.intel.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <2433376.1657198347.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Jeff Layton <jlayton@kernel.org> wrote:

> > +		folio_unlock(*folio);
> > +		folio_put(*folio);
> 
> Don't you also need this?
> 
> 	*folio = NULL;

It shouldn't need any of those three lines.

David
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

