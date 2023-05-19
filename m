Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE227093D2
	for <lists+linux-cachefs@lfdr.de>; Fri, 19 May 2023 11:40:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684489221;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=clyP8W8BUIZmse4wE4mW8g96iYfF+FII+NaB5pJl6/0=;
	b=CZzbF2Q38G7uW7RXVYa0pPQ/sx1CQRqv9BMpxTdAjONpvF6Kahc813HkAL1Dk/BvpdKlUx
	s60FnJyPsgXKaGSNfe+wF1NnSlDYl5yXx28Ndu0ulepJKcGQ0rUjGjW9yS3ns5oUnMNW1C
	l1uEGT6lRvxkfJIUdbd5Hx1L9HmFopc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-503-zN8_VG35M2eTKvRUbTuo9A-1; Fri, 19 May 2023 05:40:17 -0400
X-MC-Unique: zN8_VG35M2eTKvRUbTuo9A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3D632101A53A;
	Fri, 19 May 2023 09:40:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 84A364F2DE2;
	Fri, 19 May 2023 09:40:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4736819465B7;
	Fri, 19 May 2023 09:40:16 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6D48919465A4 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 19 May 2023 09:40:14 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5A623140E956; Fri, 19 May 2023 09:40:14 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7700A140E954;
 Fri, 19 May 2023 09:40:13 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CAAmbk-f_U8CPcTQM866L572uUHdK4p5iWKnUQs4r8fkW=6RW9g@mail.gmail.com>
References: <CAAmbk-f_U8CPcTQM866L572uUHdK4p5iWKnUQs4r8fkW=6RW9g@mail.gmail.com>
To: Chris Chilvers <chilversc@gmail.com>
MIME-Version: 1.0
Date: Fri, 19 May 2023 10:40:12 +0100
Message-ID: <1744185.1684489212@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [Linux-cachefs] [BUG] fscache writing but not reading
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
Cc: Benjamin Maynard <benmaynard@google.com>, linux-nfs@vger.kernel.org,
 linux-cachefs@redhat.com, brennandoyle@google.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <1744184.1684489212.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Chris Chilvers <chilversc@gmail.com> wrote:

> While testing the fscache performance fixes [1] that were merged into 6.4-rc1
> it appears that the caching no longer works. The client will write to the cache
> but never reads.

Can you try reading from afs?  You would need to enable CONFIG_AFS_FS in your
kernel if it's not already set.

Install kafs-client and do:

	systemctl enable afs.mount
	md5sum /afs/openafs.org/software/openafs/1.9.1/openafs-1.9.1-doc.tar.bz2
	cat /proc/fs/fscache/stats
	umount /afs/openafs.org
	md5sum /afs/openafs.org/software/openafs/1.9.1/openafs-1.9.1-doc.tar.bz2
	cat /proc/fs/fscache/stats

David
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

