Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DACD7A2672
	for <lists+linux-cachefs@lfdr.de>; Fri, 15 Sep 2023 20:44:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694803492;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DjNhS0E7XAvZVd9zISGV2NIIUy7d85ZCDGDarMwOibM=;
	b=UE9aLTrfSCrTSV8m6YF3Kr99UM0EMZkgzPALzYJ30S4XLD7HlcgAOm8HTgptjLxJakoL+T
	/gTvkxNEjMQVSfGJQinU0oT5JddueYyQGkmQhZci72fTgFCM0XQ2WtsPSPjx/xIYgbrWSq
	au0xPYaG8/argU/F5SRKS6MPAXL+HVM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-218-LvQirOExOTWbqmLqDPOhkA-1; Fri, 15 Sep 2023 14:44:46 -0400
X-MC-Unique: LvQirOExOTWbqmLqDPOhkA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A64FE101B04A;
	Fri, 15 Sep 2023 18:44:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D44741054FC5;
	Fri, 15 Sep 2023 18:44:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6B17819465B9;
	Fri, 15 Sep 2023 18:44:28 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id F2FC81946588 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 15 Sep 2023 18:42:18 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D01D01C65E; Fri, 15 Sep 2023 18:42:18 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C88E61C646
 for <linux-cachefs@redhat.com>; Fri, 15 Sep 2023 18:42:18 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A6C16101A53B
 for <linux-cachefs@redhat.com>; Fri, 15 Sep 2023 18:42:18 +0000 (UTC)
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-119-y1ZWeXQ6NWiVWZUF3B4l_w-1; Fri, 15 Sep 2023 14:42:17 -0400
X-MC-Unique: y1ZWeXQ6NWiVWZUF3B4l_w-1
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-68fbbe8a6d3so2886885b3a.0
 for <linux-cachefs@redhat.com>; Fri, 15 Sep 2023 11:42:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694803336; x=1695408136;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4SLe61c41MpedLgHIG37zN0xCNARe7YkFYGtI+CaxPE=;
 b=dCpaovQXWAetuPDFT58RnglROq8Q8TYyp6xI24LmdJZH8gzEvCuhyMCaF0q00KqWSp
 P9YLGrIGjquLLURvuTRIPrVxj2Xcv/LDmjEwYtyq8orgUE2Cx2kIqks18nGR9+owaSIH
 1LNKddGJs8jlE37IA39ixfIGnoozeizJ0tLt8A/1W4dX9vWSThZ3ah9nNW1OsUp+YxNs
 MMQxbBQ4a1l33odZSjLkgkpC9pmLwDnVzgxdqMbKAcNUQeSWqaEO8dnPJuS0w6CBh1/C
 o3ZZmzaWCi167i9NFyZjjo2kLeGJnFeA/0LmKPK6rmoGQuM+V1eTVBY1YzCN89fXfEfz
 aizg==
X-Gm-Message-State: AOJu0YyusibLlMUWcs30DiGOE4zxrm6gIGKsV51HbadzHuT1Kka4KY+V
 KHW1Vif3Ezi0wCruO7aoQ6tIO2kKyB9ydLh949cFL3VwPdpdQfXgJQIMpH/pGf8nG/ZU0I5M0CW
 QuQMFYpL2kAUTsOQlq0gqtCK4W6PT+Zr+iKmjAg==
X-Received: by 2002:a05:6a00:3688:b0:68c:59cb:2dd9 with SMTP id
 dw8-20020a056a00368800b0068c59cb2dd9mr8161782pfb.1.1694803336174; 
 Fri, 15 Sep 2023 11:42:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsp8mshIXLfhl4HOnJ8uLrCf4R08I6IsDyJr98/2jTM5xC56JH3cIcZfaMxyjzHSCWMwjOI69+Vf2bgCx5bM8=
X-Received: by 2002:a05:6a00:3688:b0:68c:59cb:2dd9 with SMTP id
 dw8-20020a056a00368800b0068c59cb2dd9mr8161770pfb.1.1694803335918; Fri, 15 Sep
 2023 11:42:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230608214137.856006-1-dwysocha@redhat.com>
 <3629819.1694784702@warthog.procyon.org.uk>
In-Reply-To: <3629819.1694784702@warthog.procyon.org.uk>
From: David Wysochanski <dwysocha@redhat.com>
Date: Fri, 15 Sep 2023 14:41:39 -0400
Message-ID: <CALF+zO=Tdp4F+DYN88Uu=7McbnsVs=bf8dX2LwPR-HGLNZ9b2Q@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [Linux-cachefs] [PATCH] netfs: Only call folio_start_fscache()
 one time for each folio
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
Cc: linux-nfs@vger.kernel.org, linux-cachefs@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gRnJpLCBTZXAgMTUsIDIwMjMgYXQgOTozMeKAr0FNIERhdmlkIEhvd2VsbHMgPGRob3dlbGxz
QHJlZGhhdC5jb20+IHdyb3RlOgo+Cj4gT2theSwgdGhpcyBsb29rcyByZWFzb25hYmxlLiAgU2hv
dWxkIEkgYXBwbHkgSmVmZidzIHN1Z2dlc3Rpb24gYmVmb3JlIEkgc2VuZAo+IGl0IHRvIExpbnVz
Pwo+Cj4gRGF2aWQKPgpJIHdpbGwgc2VuZCBhIHYyIHdpdGggSmVmZidzIHN1Z2dlc3Rpb24gYWRk
ZWQsIGFzIHdlbGwgYXMKClJldmlld2VkLWJ5OiBKZWZmIExheXRvbiA8amxheXRvbkBrZXJuZWwu
b3JnPgpMaW5rOiBodHRwczovL2J1Z3ppbGxhLnJlZGhhdC5jb20vc2hvd19idWcuY2dpP2lkPTIy
MTA2MTIKCi0tCkxpbnV4LWNhY2hlZnMgbWFpbGluZyBsaXN0CkxpbnV4LWNhY2hlZnNAcmVkaGF0
LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWNh
Y2hlZnMK

