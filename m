Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0951D547401
	for <lists+linux-cachefs@lfdr.de>; Sat, 11 Jun 2022 12:56:20 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-464-BgxflUaANSK2qCZD4MQvDw-1; Sat, 11 Jun 2022 06:56:16 -0400
X-MC-Unique: BgxflUaANSK2qCZD4MQvDw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DFEBC1C05151;
	Sat, 11 Jun 2022 10:56:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D3C2D2166B26;
	Sat, 11 Jun 2022 10:56:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9E715194705A;
	Sat, 11 Jun 2022 10:56:15 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 055781947054 for <linux-cachefs@listman.corp.redhat.com>;
 Sat, 11 Jun 2022 10:56:14 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E9BEF492CA3; Sat, 11 Jun 2022 10:56:13 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E55E9492C3B
 for <linux-cachefs@redhat.com>; Sat, 11 Jun 2022 10:56:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CDBA380159B
 for <linux-cachefs@redhat.com>; Sat, 11 Jun 2022 10:56:13 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-oVpZoM0oMQCjV_SBoAggiw-1; Sat, 11 Jun 2022 06:56:12 -0400
X-MC-Unique: oVpZoM0oMQCjV_SBoAggiw-1
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-30c143c41e5so12921127b3.3; 
 Sat, 11 Jun 2022 03:56:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eqA6H/Kd3v8qLCIvaYprcutQG+OhOEiZYNUR3mtKR8g=;
 b=aBNrDc31RldN3IK4gdKoMSIT7nBdWJtNsRrgMt7hR6cIOzNDd2oBQpmjg+JsJTzbVi
 t/XDhJkXBVUsqJ8lTJZYGz71m41tFOL+3rOKp8mQccayIBi+NfEWig/FWu8c2eQmTWLG
 W58M399n5gJGlxaHsVMdGk8zMUNkDuYlcGtbRHTLyKK/+3MMqXTmnlnZMQ19HvX0VVA1
 +TSE9/jfxI8i9iAhGJlfN756IZgzkO0wMU+wBP3qvMd+NAW2qAI+4pfCOfrYjUxP47oB
 qsDil3Qlkrhfypfa0+NN6T/jALt1eGMREMNQAKYH7q8jwtlhiLTrBY6nYzNyb6Pe0Bmg
 T2DQ==
X-Gm-Message-State: AOAM532wFikVbZiY9QTKal4KQa1Qz55wpcg8bKJyTPCT1i0j0XENNIEL
 M+1UpvLndpSdAAg2LJxfuLU10B19x3UfNHbbQIKD3+Go
X-Google-Smtp-Source: ABdhPJzMPaMP2VjmabTBvuNSAp2tyI0KZoHPUC4tMzTy1Au1VZoxjK59G/T3tyeKHoUGM5JYj+tYJXEMmKiGGgUt7c8=
X-Received: by 2002:a81:25cc:0:b0:30f:ea57:af01 with SMTP id
 l195-20020a8125cc000000b0030fea57af01mr51233219ywl.488.1654944971327; Sat, 11
 Jun 2022 03:56:11 -0700 (PDT)
MIME-Version: 1.0
References: <YqRyL2sIqQNDfky2@debian>
In-Reply-To: <YqRyL2sIqQNDfky2@debian>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Sat, 11 Jun 2022 11:55:35 +0100
Message-ID: <CADVatmOKtwSbdGcis4+44-G=UEdHWfOE3M4SBu=25vvp0TWxEA@mail.gmail.com>
To: David Howells <dhowells@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: Re: [Linux-cachefs] mainline build failure due to 6c77676645ad
 ("iov_iter: Fix iter_xarray_get_pages{, _alloc}()")
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, linux-cachefs@redhat.com,
 linux-fsdevel@vger.kernel.org, v9fs-developer@lists.sourceforge.net,
 Gao Xiang <xiang@kernel.org>, linux-erofs@lists.ozlabs.org,
 linux-afs@lists.infradead.org, devel@lists.orangefs.org,
 Mike Marshall <hubcap@omnibond.com>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Jun 11, 2022 at 11:45 AM Sudip Mukherjee
<sudipm.mukherjee@gmail.com> wrote:
>
> Hi All,
>
> The latest mainline kernel branch fails to build for "arm allmodconfig",
> "xtensa allmodconfig" and "csky allmodconfig" with the error:

missed adding "mips allmodconfig".



-- 
Regards
Sudip

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

