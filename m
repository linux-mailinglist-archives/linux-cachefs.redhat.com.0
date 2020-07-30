Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 72FCF233A4A
	for <lists+linux-cachefs@lfdr.de>; Thu, 30 Jul 2020 23:08:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596143288;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PEIeMWPfnH2MoP7K2BvLPgd81fVP2XfYCtH5WUZygs0=;
	b=fSs4qjbROXtEXLlb4J/STQGBlm6mOFC7rA5gB+oYrEXiyjW0bS7SZiWzSur34P7XGUkrNI
	moqft0l+OEJV1ecb6y6VKUmYg+9n67gq0euLQENnr4Bql+yiuUqcrO11BkWAzVhNG5HNEb
	+VdCqn/7a/P7vsCeDH+KGDmHeQP1QXQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-f-QUEA7cNgOqLVFdXMmBuA-1; Thu, 30 Jul 2020 17:08:06 -0400
X-MC-Unique: f-QUEA7cNgOqLVFdXMmBuA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DDDC5100AA22;
	Thu, 30 Jul 2020 21:08:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C44E61176;
	Thu, 30 Jul 2020 21:08:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8DDF29A0F5;
	Thu, 30 Jul 2020 21:08:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06UL7wuZ012240 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 30 Jul 2020 17:07:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BD6562156880; Thu, 30 Jul 2020 21:07:57 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 923242156A30
	for <linux-cachefs@redhat.com>; Thu, 30 Jul 2020 21:07:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2353918A6673
	for <linux-cachefs@redhat.com>; Thu, 30 Jul 2020 21:07:40 +0000 (UTC)
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
	[209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-41-w5CXAWQZM7yQMJy65fp0YA-1; Thu, 30 Jul 2020 17:07:38 -0400
X-MC-Unique: w5CXAWQZM7yQMJy65fp0YA-1
Received: by mail-ej1-f71.google.com with SMTP id c22so3521410ejk.8
	for <linux-cachefs@redhat.com>; Thu, 30 Jul 2020 14:07:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ht3KrLaeI3ImDRzCOeitAYsRgh0hAdEhk+FHcU4zLec=;
	b=uoaTybiSjeXk6HsMXZMlmYQ3N7EMQm/IXBpc1ng2bdH3XNxNZihsm1wjaTe9vi9f6F
	zI8N/zYG3vwTOlYtN0EoFDD7H4mNyRYlpizik+pW46SDpam3/JGjYF2Ky8xanxemtLHh
	xJYnjjTOCMxhIVmxUBFd1uZnju543lvSmQQNpyzTmvA4XmvOf2vv8uQa3dNRmlpHhh4B
	45KcpSfwBnnIcmns+ZmBwBogoiP6HNskzZebxOfhmeT+LLH75zNhmv/xozH78ESvcjBx
	oQtfHZjZtoA6WMEhwnzABLmiD4f4E0OG3CTy5RUE/QjMkAOhhITTpxSygWN3rnBzb8Bt
	IXvA==
X-Gm-Message-State: AOAM530u+xVLGlFTQyWbOdAqSd6HW5LitS8DNQker+p4mGDiO/5AQnAx
	zTQP2+QfSz+0WRVxfP031TluLwFnec4X609NRBDUcD1oIrJ8JLWZCaURo3ugP98APf7DF9cj7jH
	xZUCocGT0OzoDkGqkDU9Aqlg8BDNnrV/0NVRZgw==
X-Received: by 2002:a05:6402:308e:: with SMTP id
	de14mr885968edb.344.1596143257068; 
	Thu, 30 Jul 2020 14:07:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhDlWIxlkkSOshNRcp7+sCHDQQQnq19BFBRfOCtLp+uOgKHUPzU9l6XG07+ZYb8ag76V2jJhBU4ndzaJym7js=
X-Received: by 2002:a05:6402:308e:: with SMTP id
	de14mr885956edb.344.1596143256912; 
	Thu, 30 Jul 2020 14:07:36 -0700 (PDT)
MIME-Version: 1.0
References: <1596031949-26793-1-git-send-email-dwysocha@redhat.com>
	<1596031949-26793-14-git-send-email-dwysocha@redhat.com>
	<43e8a8ff1ea015bb7bd335d5616268d36155327a.camel@redhat.com>
	<CALF+zOnYLbibbYxvbyUJFJQ+NtcreuAvFkZYr9h3_qQswbMxRw@mail.gmail.com>
	<CALF+zOn9tSft_QkPaJ7w8v_OLTfon+acUB_W9MSb8EEMQGc94w@mail.gmail.com>
	<538846.1596139431@warthog.procyon.org.uk>
In-Reply-To: <538846.1596139431@warthog.procyon.org.uk>
From: David Wysochanski <dwysocha@redhat.com>
Date: Thu, 30 Jul 2020 17:07:00 -0400
Message-ID: <CALF+zO=8jkarrv8un3Ea5N2_8p72gqtqp27uePG4CbJAwxv9Sw@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-cachefs@redhat.com
Cc: linux-nfs <linux-nfs@vger.kernel.org>, linux-cachefs@redhat.com,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Trond Myklebust <trondmy@hammerspace.com>
Subject: Re: [Linux-cachefs] [RFC PATCH v2 13/14] NFS: Call
 fscache_resize_cookie() when inode size changes due to setattr
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jul 30, 2020 at 4:03 PM David Howells <dhowells@redhat.com> wrote:
>
> David Wysochanski <dwysocha@redhat.com> wrote:
>
> > To be honest I'm not sure about needing a call to fscache_use/unuse_cookie()
> > around the call to fscache_resize_cookie().  If the cookie has a
> > refcount of 1 when it is created, and a file is never opened, so
> > we never call fscache_use_cookie(), what might happen inside
> > fscache_resize_cookie()?  The header on use_cookie() says
>
> I've have afs_setattr() doing use/unuse on the cookie around resize.
>
> David
>

Got it and will be fixed in next series.  Thanks!

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

