Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B114F56AF72
	for <lists+linux-cachefs@lfdr.de>; Fri,  8 Jul 2022 02:35:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657240503;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2P8L4/27adPd1PUQz/eqkVrFCIBJRDvT9Hh44HrneyM=;
	b=J1oqqdf77+SbLfdPcIGfeBM7cjQNbJygQune5WulZ/qZNd+O3bPbmkoJ0992eaAttnr2br
	xYFjTjAOsfxJUr9WzYyocGTmxetA4wbOzyWzqrsVP5tbivHtagb+Fx1Q/bdxK1iS1f5Egl
	WfN8QyKcHxr9L+bGGE/nay55SiD87kg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-198-o2Zjv9jxNcC8R84ITdZgFg-1; Thu, 07 Jul 2022 20:34:54 -0400
X-MC-Unique: o2Zjv9jxNcC8R84ITdZgFg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 105FE3802B80;
	Fri,  8 Jul 2022 00:34:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 476B62166B29;
	Fri,  8 Jul 2022 00:34:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1CE0F1947072;
	Fri,  8 Jul 2022 00:34:53 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EB4BD194706B for <linux-cachefs@listman.corp.redhat.com>;
 Fri,  8 Jul 2022 00:34:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DBF0FC28118; Fri,  8 Jul 2022 00:34:51 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D86B2C23DBF
 for <linux-cachefs@redhat.com>; Fri,  8 Jul 2022 00:34:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BF74C101A586
 for <linux-cachefs@redhat.com>; Fri,  8 Jul 2022 00:34:51 +0000 (UTC)
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-122-_RnJW3eTPSSoBnGoqBA6Fw-1; Thu, 07 Jul 2022 20:34:50 -0400
X-MC-Unique: _RnJW3eTPSSoBnGoqBA6Fw-1
Received: by mail-pf1-f200.google.com with SMTP id
 a127-20020a624d85000000b00525950b1feeso8198444pfb.0
 for <linux-cachefs@redhat.com>; Thu, 07 Jul 2022 17:34:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=sAdfxmW8RF+AZ9EDvY1OeIPpyhjibGeFRdYERWEBXJ0=;
 b=VozOoQDelKy4gDsxkRAb15X7SFOJFZrIwy0VT/t5F/+HlSBsG/q3w4jOPcw62glbF2
 gGch3SVZOrSGKavNsleZn0amHCYJa+4ZTPerDbtIel2SpGUYk7lhFKgM2RCyOfhjL1R+
 3q9f3WrnTYu4M/22/OqLSgsesptuMOG+YM703qkmCtXyNgSB/A4eFd18PzNmQZiWfB41
 CEhRdUbjo2fY93tMZdc6mnS3EA5LR6P5Vvnw1tIn9WOo7JzRNP8wA3dWq2jrdLpdi88L
 tTktL0Mwup5SV0olKrIsRdjTEEXpcgMbsUgphhb1uMJgZO/lt3n+3EDjCxceJBahy/kF
 zlcw==
X-Gm-Message-State: AJIora/8hblYguiUBYxzdFinNr2QLNsmqi06hccgifvMP4XRQCXys8cS
 7QoCq5YNvbnjiBl9t66xeMsz60OkXP4f2m8CVAzJWS7goDRC+SrnBOD9YNTXkfFd1Q3Pyqh4Crq
 Mbi9M1Yuu7DHe7XsFGEaIbw==
X-Received: by 2002:a05:6a00:a8b:b0:4e1:52db:9e5c with SMTP id
 b11-20020a056a000a8b00b004e152db9e5cmr1000611pfl.38.1657240489536; 
 Thu, 07 Jul 2022 17:34:49 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uSUVNLziJFu4GfOCBs8dy/vRXb0JGhtZPTokt7fqNMumRCZo7HOzSxp0rdxI9MeBMR5F9NbA==
X-Received: by 2002:a05:6a00:a8b:b0:4e1:52db:9e5c with SMTP id
 b11-20020a056a000a8b00b004e152db9e5cmr1000587pfl.38.1657240489335; 
 Thu, 07 Jul 2022 17:34:49 -0700 (PDT)
Received: from [10.72.12.227] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 m22-20020a62a216000000b005289753448fsm6160102pff.123.2022.07.07.17.34.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jul 2022 17:34:48 -0700 (PDT)
To: David Howells <dhowells@redhat.com>
References: <20220707045112.10177-2-xiubli@redhat.com>
 <20220707045112.10177-1-xiubli@redhat.com>
 <2341366.1657197157@warthog.procyon.org.uk>
From: Xiubo Li <xiubli@redhat.com>
Message-ID: <7f5467e2-c01a-b327-44f7-97cd34e4e0b1@redhat.com>
Date: Fri, 8 Jul 2022 08:34:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <2341366.1657197157@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"


On 7/7/22 8:32 PM, David Howells wrote:
> xiubli@redhat.com wrote:
>
>> URL: https://tracker.ceph.com/issues/56423
> I think that should be "Link:".

Okay, in ceph tree we are using the "URL:".

-- Xiubo

>
> David
>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

