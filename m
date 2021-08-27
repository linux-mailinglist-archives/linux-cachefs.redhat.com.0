Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8002D3F9930
	for <lists+linux-cachefs@lfdr.de>; Fri, 27 Aug 2021 14:50:05 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-1ZRnvuoVOFWwkmE7bQJryg-1; Fri, 27 Aug 2021 08:50:03 -0400
X-MC-Unique: 1ZRnvuoVOFWwkmE7bQJryg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BEC5108292C;
	Fri, 27 Aug 2021 12:50:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BFF555D9C6;
	Fri, 27 Aug 2021 12:50:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 363024A7C8;
	Fri, 27 Aug 2021 12:50:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17RCnudB017902 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 27 Aug 2021 08:49:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6025220A8C04; Fri, 27 Aug 2021 12:49:56 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B7C220A88BE
	for <linux-cachefs@redhat.com>; Fri, 27 Aug 2021 12:49:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9D10C800963
	for <linux-cachefs@redhat.com>; Fri, 27 Aug 2021 12:49:53 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
	[209.85.208.42]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-171-o2oDlZUBMpqFyTS3uM20MQ-1; Fri, 27 Aug 2021 08:49:49 -0400
X-MC-Unique: o2oDlZUBMpqFyTS3uM20MQ-1
Received: by mail-ed1-f42.google.com with SMTP id eb14so530110edb.8;
	Fri, 27 Aug 2021 05:49:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6BL24id7m8wPcedNjNI4ZZt0Go13BjZ8iUQt2C7HOss=;
	b=hatkjIdfJLauiEowRULyy/Qc9gRnQ/m61Ni+uq9g0NJTu5sSZn5l75zWfcnzC9Fpbn
	1Y/TpO/Cz5wdEnJau4JwNna6W0W/6yZWc8WAkNfviXDEd8knAfSGM6pmcVjG7QvpVFSV
	KvHe9mRIG+cX6oBymU7YShElXjFrkYpesHsFKHNiXb3+irx2J3asI+nXdy1D/g8Kgtsd
	kp6/GHBsM3PsCis6p+q5dERD+ifWJ9LKAC6lOfVTmP6c1MfplKjay/nLCCE39xBhpnHS
	y+A6yOEBxoR798eph1hL0FWo9FyIojdhgSh9Oxz6XYkVTx7wGy7VCxr0NjeV7iumJQxz
	Hzww==
X-Gm-Message-State: AOAM531lSVsJ1EckaK89fXnZ947E4vNn35SJzUknNM2ORzWGjKmxN/v3
	UendMhIRhAEqOguzn/s5yBU1URKke0eWjMGZ
X-Google-Smtp-Source: ABdhPJxR3oCRWkd++tnLXVM93Q3yuGTyZGYgJRoXgZ3Fl+kw+eyl6PuWb1vXLdv8QBbld/cI/NPlew==
X-Received: by 2002:aa7:c903:: with SMTP id b3mr9735616edt.23.1630068588114;
	Fri, 27 Aug 2021 05:49:48 -0700 (PDT)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com.
	[209.85.128.48]) by smtp.gmail.com with ESMTPSA id
	j9sm2841393ejk.112.2021.08.27.05.49.47
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 27 Aug 2021 05:49:47 -0700 (PDT)
Received: by mail-wm1-f48.google.com with SMTP id
	79-20020a1c0452000000b002e6cf79e572so9158657wme.1; 
	Fri, 27 Aug 2021 05:49:47 -0700 (PDT)
X-Received: by 2002:a05:600c:35c1:: with SMTP id
	r1mr8646060wmq.101.1630068587111; 
	Fri, 27 Aug 2021 05:49:47 -0700 (PDT)
MIME-Version: 1.0
References: <162431188431.2908479.14031376932042135080.stgit@warthog.procyon.org.uk>
	<162431193544.2908479.17556704572948300790.stgit@warthog.procyon.org.uk>
	<2512396.1630067489@warthog.procyon.org.uk>
In-Reply-To: <2512396.1630067489@warthog.procyon.org.uk>
From: Marc Dionne <marc.dionne@auristor.com>
Date: Fri, 27 Aug 2021 09:49:35 -0300
X-Gmail-Original-Message-ID: <CAB9dFdufkVyqS4NadbqVrtjmciLvpuAZOU8woWWcURcnuaZ=GA@mail.gmail.com>
Message-ID: <CAB9dFdufkVyqS4NadbqVrtjmciLvpuAZOU8woWWcURcnuaZ=GA@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	Dominique Martinet <asmadeus@codewreck.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Steve French <sfrench@samba.org>, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	linux-afs@lists.infradead.org
Subject: Re: [Linux-cachefs] [PATCH v2 04/12] fscache: Add a cookie debug ID
 and use that in traces
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Aug 27, 2021 at 9:31 AM David Howells <dhowells@redhat.com> wrote:
>
>
> Add a cookie debug ID and use that in traces and in procfiles rather than
> displaying the (hashed) pointer to the cookie.  This is easier to correlate
> and we don't lose anything when interpreting oops output since that shows
> unhashed addresses and registers that aren't comparable to the hashed
> values.
>
> Changes:
>
> ver #2:
>  - Fix the fscache_op tracepoint to handle a NULL cookie pointer.
>
> Signed-off-by: David Howells <dhowells@redhat.com>
> Reviewed-by: Jeff Layton <jlayton@redhat.com>
> cc: linux-cachefs@redhat.com
> Link: https://lore.kernel.org/r/158861210988.340223.11688464116498247790.stgit@warthog.procyon.org.uk/ # rfc
> Link: https://lore.kernel.org/r/159465769844.1376105.14119502774019865432.stgit@warthog.procyon.org.uk/
> Link: https://lore.kernel.org/r/160588459097.3465195.1273313637721852165.stgit@warthog.procyon.org.uk/ # rfc
> Link: https://lore.kernel.org/r/162431193544.2908479.17556704572948300790.stgit@warthog.procyon.org.uk/

Reviewed-by: Marc Dionne <marc.dionne@auristor.com>

Marc

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

