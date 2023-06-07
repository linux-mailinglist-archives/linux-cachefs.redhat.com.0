Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3419D7268A3
	for <lists+linux-cachefs@lfdr.de>; Wed,  7 Jun 2023 20:26:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686162405;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hhJ1theT9u4U7tN7a5yQ2fdgvOtEUFnZF27ti/Rk/8o=;
	b=S94l9KOjIYY6KgQ4mvXQ41JSqVezXo7lQi3k1+L3NWK8wcIHepaLKxKoac8BWT7q2E1BqV
	JFX9o5q67DPvhMauB2RWk8/WvY46QnkLO32WfqRNdmgNwUaAoWk+SNyaHrhDvF+5W/XWiL
	Qs6nNF2LIGnVSXW8jULJh7kmnYW6tHA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-451-a58dMA6OOyydrIC16rlHFQ-1; Wed, 07 Jun 2023 14:26:44 -0400
X-MC-Unique: a58dMA6OOyydrIC16rlHFQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8387485A5A8;
	Wed,  7 Jun 2023 18:26:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 81E622166B26;
	Wed,  7 Jun 2023 18:26:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B3C2A19452C6;
	Wed,  7 Jun 2023 18:26:41 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0D36519465BA for <linux-cachefs@listman.corp.redhat.com>;
 Wed,  7 Jun 2023 18:26:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B9C122166B26; Wed,  7 Jun 2023 18:26:40 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B13022166B25
 for <linux-cachefs@redhat.com>; Wed,  7 Jun 2023 18:26:40 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 90F051C04B5E
 for <linux-cachefs@redhat.com>; Wed,  7 Jun 2023 18:26:40 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-131-T419SQ0rOHWoy5PTwZKSsA-1; Wed, 07 Jun 2023 14:26:37 -0400
X-MC-Unique: T419SQ0rOHWoy5PTwZKSsA-1
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-9788faaca2dso51916466b.0; 
 Wed, 07 Jun 2023 11:26:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686162395; x=1688754395;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wODPx4uHZJHUTcdDegTDGQs4CeriK253kkjDqRsBvLs=;
 b=ULiCvvvBf+TPlG/baNoYyW1ylU/OLkbUoKKifdOOSGtnAry2sMRfqz47z1AnLObPAS
 RSUeMZr+QK5zvRXO4mGGTconnpzf+RsnKjhv7Mkzu+3lrTKSwkM04fS+AXQJElQPpbF6
 Gs25l0HQ8dqikZNoxPvj6KQN1Lne+H3SeeoRQAgPJYixRMWh5JYrnOLY6730pjiOGpcM
 vLIqj39ntWSpKfkUHV3pWR/C2r3cotPP8eRa0ITW65FXF9OpN/6AJRXZ8vaVW4XE5gjN
 5EpTWdXhIFw4oeWGikUbTI2nwdGH+CkzZ1M6ot6izoknOUZ0mVz+AkuqLOTsIHYPQxYE
 7yfQ==
X-Gm-Message-State: AC+VfDwU6ENal4JHnnUz1rjVbk9PtHJsBAQsCXnKnU1d3kkkiKwDk3s2
 pU47tZ0GBfyKAgTAJzCtZv4qIyojo438+2cOUisy3CLw/4I=
X-Google-Smtp-Source: ACHHUZ4gkb4uXmtBfRalz/8gTBT4f6/AWlotdJNjgnU0y7BmJ/z28Vm/frajygWJFDgVS+dJ1qAf3w6FaHOtUUKNuBY=
X-Received: by 2002:a17:907:2d2c:b0:977:c8a7:bed5 with SMTP id
 gs44-20020a1709072d2c00b00977c8a7bed5mr7336385ejc.47.1686162395234; Wed, 07
 Jun 2023 11:26:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230216150701.3654894-1-dhowells@redhat.com>
 <CALF+zO=w2Gyz6JtzEoFgTVjH67-_CuTaK7e+2yoHEwXZ8bPx_A@mail.gmail.com>
 <CALF+zO=Y8dMsJ79RYp1e7n9B5_0=segpqW9_tetBqPhFiQcZxA@mail.gmail.com>
In-Reply-To: <CALF+zO=Y8dMsJ79RYp1e7n9B5_0=segpqW9_tetBqPhFiQcZxA@mail.gmail.com>
From: Chris Chilvers <chilversc@gmail.com>
Date: Wed, 7 Jun 2023 19:26:23 +0100
Message-ID: <CAAmbk-cBJprmRsW5uktAm49NtVw9WTLA=LPS7uLkwAknjs_1qA@mail.gmail.com>
To: David Howells <dhowells@redhat.com>, Matthew Wilcox <willy@infradead.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: Re: [Linux-cachefs] [PATCH v6 0/2] mm, netfs,
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
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org,
 v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 linux-afs@lists.infradead.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Any update on this? I assume it's too late for these patches to make 6.4.0.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

