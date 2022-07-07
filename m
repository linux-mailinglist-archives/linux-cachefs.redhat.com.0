Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AC956A202
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Jul 2022 14:32:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657197168;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EFBeRztKDtI9WWZNjpBbuhPG3qyX2/k8KmOpZiwYcpY=;
	b=J9DpRczvhpudhr1yrnHow3ooJIogwDjy1G0AIz5iqUhk7oZvB4GJxzdC4yHLOntRBVzCPM
	aLEa09E363uP3oV9qy0HrfemivZndDVTTTzPf/HuVem/mRqjNPe7w6DWjI4OrFnFWjrdU/
	6wafbpOGi9Gy5Zf0Z7qm2x+ggfCEvqI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-96-BFu2XyRCO6-jKOlT6g7bXg-1; Thu, 07 Jul 2022 08:32:44 -0400
X-MC-Unique: BFu2XyRCO6-jKOlT6g7bXg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B66293C0E214;
	Thu,  7 Jul 2022 12:32:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DB520C04482;
	Thu,  7 Jul 2022 12:32:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 95FE8194706C;
	Thu,  7 Jul 2022 12:32:41 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4A5611947069 for <linux-cachefs@listman.corp.redhat.com>;
 Thu,  7 Jul 2022 12:32:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 175DF40D282F; Thu,  7 Jul 2022 12:32:40 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.37.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7D30040C141D;
 Thu,  7 Jul 2022 12:32:38 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20220707045112.10177-2-xiubli@redhat.com>
References: <20220707045112.10177-2-xiubli@redhat.com>
 <20220707045112.10177-1-xiubli@redhat.com>
To: xiubli@redhat.com
MIME-Version: 1.0
Date: Thu, 07 Jul 2022 13:32:37 +0100
Message-ID: <2341366.1657197157@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: Re: [Linux-cachefs] [PATCH v3 1/2] netfs: do not unlock and put the
 folio twice
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
Cc: keescook@chromium.org, jlayton@kernel.org, linux-kernel@vger.kernel.org,
 willy@infradead.org, william.kucharski@oracle.com, linux-cachefs@redhat.com,
 vshankar@redhat.com, marc.dionne@auristor.com, ceph-devel@vger.kernel.org,
 idryomov@gmail.com, linux-afs@lists.infradead.org,
 kirill.shutemov@linux.intel.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <2341365.1657197157.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

xiubli@redhat.com wrote:

> URL: https://tracker.ceph.com/issues/56423

I think that should be "Link:".

David
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

