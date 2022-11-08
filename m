Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECF862092A
	for <lists+linux-cachefs@lfdr.de>; Tue,  8 Nov 2022 06:55:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667886903;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=O7ggLeepgGccaMZy7nDWKoS6RwETA/+B0l1Mi7OuvFs=;
	b=PzVlmXTe1RnNwahwdnm08scY7Ln1GtxEiz5WgDQ1Lw0ZeGyTYQJ29+NylWIVjo1lZkr0M2
	EtHSwGASDJDzp2pupZDffFKiYd3lhzNSknX05ZFOKWwn2ylJN/QGedzRZDWnB3f+PgkAET
	pFNehu0GfjtLqyb5aeVcaZpor5Ea2sw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-295-jBhHfivAO3yu1eFT5yP6Pw-1; Tue, 08 Nov 2022 00:54:59 -0500
X-MC-Unique: jBhHfivAO3yu1eFT5yP6Pw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ABD06185A79C;
	Tue,  8 Nov 2022 05:54:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A65A840C2064;
	Tue,  8 Nov 2022 05:54:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7BA1E194658C;
	Tue,  8 Nov 2022 05:54:56 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DF0C21946587 for <linux-cachefs@listman.corp.redhat.com>;
 Tue,  8 Nov 2022 05:54:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CFB521410DDA; Tue,  8 Nov 2022 05:54:55 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C85DD140EBF5
 for <linux-cachefs@redhat.com>; Tue,  8 Nov 2022 05:54:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A7ED185A59D
 for <linux-cachefs@redhat.com>; Tue,  8 Nov 2022 05:54:55 +0000 (UTC)
Received: from out30-43.freemail.mail.aliyun.com
 (out30-43.freemail.mail.aliyun.com [115.124.30.43]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256)
 id us-mta-364-m_PTBIiwOume18t5YGOXUQ-1; Tue, 08 Nov 2022 00:54:52 -0500
X-MC-Unique: m_PTBIiwOume18t5YGOXUQ-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R121e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045168;
 MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=6; SR=0;
 TI=SMTPD_---0VUHuOoP_1667886888
Received: from 30.221.131.213(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VUHuOoP_1667886888) by smtp.aliyun-inc.com;
 Tue, 08 Nov 2022 13:54:49 +0800
Message-ID: <084d78a4-6052-f2ec-72f2-af9c4979f5dc@linux.alibaba.com>
Date: Tue, 8 Nov 2022 13:54:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
To: David Howells <dhowells@redhat.com>, willy@infradead.org
References: <166757987929.950645.12595273010425381286.stgit@warthog.procyon.org.uk>
 <166757988611.950645.7626959069846893164.stgit@warthog.procyon.org.uk>
From: JeffleXu <jefflexu@linux.alibaba.com>
In-Reply-To: <166757988611.950645.7626959069846893164.stgit@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [Linux-cachefs] [PATCH v2 2/2] netfs: Fix dodgy maths
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
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 11/5/22 12:38 AM, David Howells wrote:
> Fix the dodgy maths in netfs_rreq_unlock_folios().  start_page could be
> inside the folio, in which case the calculation of pgpos will be come up
> with a negative number (though for the moment rreq->start is rounded down
> earlier and folios would have to get merged whilst locked)

Hi, the patch itself seems fine. Just some questions about the scenario.

1. "start_page could be inside the folio" Is that because
.expand_readahead() called from netfs_readahead()? Since otherwise,
req-start is always aligned to the folio boundary.

2. If start_page is indeed inside the folio, then only the trailing part
of the first folio can be covered by the request, and this folio will be
marked with uptodate, though the beginning part of the folio may have
not been read from the cache. Is that expected? Or correct me if I'm wrong.


-- 
Thanks,
Jingbo

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

